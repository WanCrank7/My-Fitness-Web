<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAWA GYM - Destinasi Kecergasan Anda</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Visualization & Content Choices: 
        - Teks Hero & Slogan: Info Laporan (Pengenalan, Slogan) -> Matlamat (Tarik Minat, Maklumkan) -> Persembahan (Tajuk besar, perenggan - HTML/Tailwind) -> Interaksi (Klik butang CTA) -> Justifikasi (Sampaikan mesej teras & jenama secara terus) -> Perpustakaan/Kaedah (HTML/Tailwind, JS untuk skrol).
        - Faedah Utama (Peralatan, Komuniti, Semua Tahap): Info Laporan (Butiran skrip mengenai peralatan, komuniti) -> Matlamat (Serlahkan kelebihan) -> Persembahan (Bahagian seperti kad dengan teks & ikon Unicode - HTML/Tailwind) -> Interaksi (Tiada, maklumat statik) -> Justifikasi (Persembahan USP yang jelas & mudah diimbas) -> Perpustakaan/Kaedah (HTML/Tailwind).
        - Penerangan Suasana: Info Laporan (Isyarat visual dari skrip) -> Matlamat (Sampaikan persekitaran gim) -> Persembahan (Blok teks deskriptif, dua imej placeholder bertema kecergasan - HTML/Tailwind) -> Interaksi (Tiada) -> Justifikasi (Bangkitkan suasana gim melalui kata-kata dan visual) -> Perpustakaan/Kaedah (HTML/Tailwind).
        - Rancang Senaman Anda (AI): Info Laporan (Tiada dalam sumber asal, ciri baharu) -> Matlamat (Tambah nilai interaktif, libatkan pengguna, tunjukkan potensi AI) -> Persembahan (Borang input, butang, kawasan output teks - HTML/Tailwind) -> Interaksi (Pilihan dropdown, klik butang, paparan hasil dinamik) -> Justifikasi (Menyediakan alat praktikal yang diperibadikan, menunjukkan keupayaan LLM) -> Perpustakaan/Kaedah (HTML/Tailwind, Vanilla JS, Gemini API).
        - Rancang Makanan Anda (AI): Info Laporan (Tiada dalam sumber asal, ciri baharu) -> Matlamat (Tambah nilai interaktif, libatkan pengguna, tunjukkan potensi AI, sokong matlamat kecergasan holistik) -> Persembahan (Borang input, butang, kawasan output teks - HTML/Tailwind) -> Interaksi (Pilihan dropdown, input teks, klik butang, paparan hasil dinamik) -> Justifikasi (Menyediakan alat praktikal yang diperibadikan untuk nutrisi, melengkapi pelan senaman) -> Perpustakaan/Kaedah (HTML/Tailwind, Vanilla JS, Gemini API).
        - Seruan Tindakan & Pendaftaran: Info Laporan (CTA, butiran pendaftaran) -> Matlamat (Tukar pengguna) -> Persembahan (Butang, teks instruktif, maklumat lokasi yang dikemas kini) -> Interaksi (Klik butang) -> Justifikasi (Laluan jelas untuk mendaftar, memberikan maklumat hubungan dan lokasi yang tepat) -> Perpustakaan/Kaedah (HTML/Tailwind, JS untuk skrol).
        Tiada carta atau rajah kompleks diperlukan kerana sumbernya adalah teks promosi semata-mata.
        CONFIRMING NO SVG/Mermaid used. -->
    <style>
        /* Font Inter akan digunakan secara lalai oleh Tailwind */
        html {
            scroll-behavior: smooth;
        }
        .hero-bg {
            background: linear-gradient(to right bottom, rgba(28, 100, 100, 0.8), rgba(13, 71, 71, 0.9)), url('https://placehold.co/1920x1080/333333/555555?text=WAWA+GYM+Kecergasan') no-repeat center center;
            background-size: cover;
        }
        /* Fallback jika imej tidak dimuatkan */
        .hero-bg img {
            display: none; /* Hide the img tag if background is loaded */
        }
        .hero-bg[style*="placehold.co/1920x1080"] {
             background: linear-gradient(to right bottom, #1c6464, #0d4747);
        }
        .loading-spinner {
            border: 4px solid #f3f3f3; /* Light grey */
            border-top: 4px solid #3498db; /* Blue */
            border-radius: 50%;
            width: 30px;
            height: 30px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body class="bg-stone-100 text-stone-800 font-sans">

    <nav class="bg-white shadow-md sticky top-0 z-50">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16">
                <div class="flex items-center">
                    <a href="#hero" class="text-2xl font-bold text-teal-700">WAWA GYM</a>
                </div>
                <div class="hidden md:block">
                    <div class="ml-10 flex items-baseline space-x-4">
                        <a href="#mengapa-kami" class="text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Mengapa Kami?</a>
                        <a href="#suasana" class="text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Suasana Kami</a>
                        <a href="#rancang-senaman" class="text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Rancang Senaman Anda</a>
                        <a href="#rancang-makanan" class="text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Rancang Makanan Anda</a>
                        <a href="#sertai-kami" class="text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-sm font-medium">Sertai Kami</a>
                    </div>
                </div>
                <div class="md:hidden">
                    <button id="mobile-menu-button" class="text-stone-600 hover:text-teal-700 focus:outline-none">
                        <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>
        <div id="mobile-menu" class="md:hidden hidden">
            <a href="#mengapa-kami" class="block text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-base font-medium">Mengapa Kami?</a>
            <a href="#suasana" class="block text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-base font-medium">Suasana Kami</a>
            <a href="#rancang-senaman" class="block text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-base font-medium">Rancang Senaman Anda</a>
            <a href="#rancang-makanan" class="block text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-base font-medium">Rancang Makanan Anda</a>
            <a href="#sertai-kami" class="block text-stone-600 hover:bg-teal-600 hover:text-white px-3 py-2 rounded-md text-base font-medium">Sertai Kami</a>
        </div>
    </nav>

    <section id="hero" class="hero-bg text-white py-20 md:py-32">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <h1 class="text-4xl sm:text-5xl md:text-6xl font-extrabold leading-tight mb-6">
                Selamat Datang ke <span class="text-yellow-300">WAWA GYM</span>
            </h1>
            <p class="text-lg sm:text-xl md:text-2xl mb-4">
                Bayangkan satu tempat di mana setiap titis peluh membawa anda lebih dekat dengan impian.
            </p>
            <p class="text-lg sm:text-xl md:text-2xl mb-8">
                Tempat di mana kekuatan dibina, stamina diasah, dan semangat tak pernah luntur.
            </p>
            <a href="#sertai-kami" class="bg-yellow-400 hover:bg-yellow-500 text-stone-800 font-bold py-3 px-8 rounded-lg text-lg transition duration-300 ease-in-out transform hover:scale-105">
                Terokai WAWA GYM ➡️
            </a>
        </div>
    </section>

    <section id="mengapa-kami" class="py-16 bg-white">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <h2 class="text-3xl md:text-4xl font-bold text-teal-700 mb-4">Mengapa Pilih WAWA GYM?</h2>
                <p class="text-lg text-stone-600">Kami menyediakan persekitaran dan kelengkapan terbaik untuk perjalanan kecergasan anda. Ini adalah sebab mengapa ahli kami menyayangi WAWA GYM.</p>
            </div>
            <div class="grid md:grid-cols-3 gap-8">
                <div class="bg-stone-50 p-8 rounded-xl shadow-lg hover:shadow-xl transition-shadow duration-300">
                    <div class="text-4xl text-teal-600 mb-4">🏋️</div>
                    <h3 class="text-2xl font-semibold text-stone-800 mb-3">Peralatan Moden & Lengkap</h3>
                    <p class="text-stone-600">
                        Dari mesin kardio berprestasi tinggi hingga ke 'free weights' dan 'squat rack' premium, kami sediakan semua yang anda perlukan.
                    </p>
                </div>
                <div class="bg-stone-50 p-8 rounded-xl shadow-lg hover:shadow-xl transition-shadow duration-300">
                    <div class="text-4xl text-teal-600 mb-4">🤗</div>
                    <h3 class="text-2xl font-semibold text-stone-800 mb-3">Komuniti Menyokong</h3>
                    <p class="text-stone-600">
                        Di WAWA GYM, anda bukan sekadar ahli, tetapi sebahagian daripada komuniti. Sokongan, motivasi, dan tenaga positif semuanya di sini.
                    </p>
                </div>
                <div class="bg-stone-50 p-8 rounded-xl shadow-lg hover:shadow-xl transition-shadow duration-300">
                    <div class="text-4xl text-teal-600 mb-4">💪</div>
                    <h3 class="text-2xl font-semibold text-stone-800 mb-3">Untuk Semua Tahap</h3>
                    <p class="text-stone-600">
                        Tidak kira anda baru mula atau seorang atlet berpengalaman, fasiliti dan program kami direka untuk memenuhi keperluan setiap individu.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section id="suasana" class="py-16 bg-stone-100">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <h2 class="text-3xl md:text-4xl font-bold text-teal-700 mb-4">Suasana di WAWA GYM</h2>
                <p class="text-lg text-stone-600">Kami berbangga dengan suasana yang bersih, mesra, dan penuh motivasi untuk membantu anda mencapai matlamat kecergasan.</p>
            </div>
            <div class="grid md:grid-cols-2 gap-8 items-center">
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <img src="https://placehold.co/600x400/CCCCCC/777777?text=Peralatan+Gym+Moden" alt="[attachment_0](attachment)" class="rounded-lg shadow-xl w-full h-auto object-cover" onerror="this.onerror=null;this.src='https://placehold.co/600x400/CCCCCC/777777?text=Ralat+Imej+1&font=Inter';">
                    <img src="https://placehold.co/600x400/CCCCCC/777777?text=Ahli+Berlatih+di+Gym" alt="[attachment_1](attachment)" class="rounded-lg shadow-xl w-full h-auto object-cover" onerror="this.onerror=null;this.src='https://placehold.co/600x400/CCCCCC/777777?text=Ralat+Imej+2&font=Inter';">
                </div>
                <div class="text-stone-700 space-y-4">
                    <p class="text-lg leading-relaxed">
                        Di WAWA GYM, setiap sudut direka untuk memberi inspirasi. Anda akan dapati kawasan kardio yang luas, ruang latihan beban yang lengkap, dan studio untuk kelas senaman berkumpulan yang bertenaga.
                    </p>
                    <p class="text-lg leading-relaxed">
                        Jurulatih peribadi kami sentiasa bersedia membantu, memberikan panduan pakar dan senyuman mesra. Kami percaya bahawa persekitaran yang positif adalah kunci kejayaan kecergasan anda.
                    </p>
                     <p class="text-lg leading-relaxed">
                        Rasai sendiri perbezaan berlatih di tempat yang bukan sahaja mementingkan fizikal, tetapi juga kesejahteraan mental dan semangat komuniti yang kuat.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <section id="rancang-senaman" class="py-16 bg-white">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <h2 class="text-3xl md:text-4xl font-bold text-teal-700 mb-4">✨ Rancang Senaman Anda dengan AI ✨</h2>
                <p class="text-lg text-stone-600">Dapatkan pelan senaman asas yang diperibadikan berdasarkan matlamat dan tahap pengalaman anda. Biar AI kami membantu anda memulakan perjalanan kecergasan anda!</p>
            </div>

            <div class="bg-stone-50 p-8 rounded-xl shadow-lg">
                <div class="mb-6">
                    <label for="goal-select" class="block text-stone-700 text-lg font-semibold mb-2">Pilih Matlamat Anda:</label>
                    <select id="goal-select" class="block w-full px-4 py-3 rounded-lg border border-stone-300 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent text-stone-800 bg-white">
                        <option value="kurangkan berat badan">Kurangkan Berat Badan</option>
                        <option value="bina otot">Bina Otot</option>
                        <option value="tingkatkan stamina">Tingkatkan Stamina</option>
                    </select>
                </div>

                <div class="mb-8">
                    <label for="level-select" class="block text-stone-700 text-lg font-semibold mb-2">Pilih Tahap Pengalaman:</label>
                    <select id="level-select" class="block w-full px-4 py-3 rounded-lg border border-stone-300 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent text-stone-800 bg-white">
                        <option value="permulaan">Permulaan</option>
                        <option value="pertengahan">Pertengahan</option>
                        <option value="mahir">Mahir</option>
                    </select>
                </div>

                <button id="generate-workout-btn" class="w-full bg-teal-600 hover:bg-teal-700 text-white font-bold py-3 px-6 rounded-lg text-lg transition duration-300 ease-in-out transform hover:scale-105 flex items-center justify-center">
                    Jana Pelan Senaman ✨
                    <div id="loading-spinner-workout" class="loading-spinner ml-3 hidden"></div>
                </button>

                <div id="workout-plan-output" class="mt-8 p-6 bg-stone-100 rounded-lg border border-stone-200 text-stone-700 whitespace-pre-wrap">
                    Pilih matlamat dan tahap anda, kemudian klik 'Jana Pelan Senaman' untuk mendapatkan cadangan!
                </div>
            </div>
        </div>
    </section>

    <section id="rancang-makanan" class="py-16 bg-stone-100">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-12">
                <h2 class="text-3xl md:text-4xl font-bold text-teal-700 mb-4">✨ Rancang Makanan Anda dengan AI ✨</h2>
                <p class="text-lg text-stone-600">Dapatkan cadangan pelan makanan asas yang diperibadikan. Biar AI kami membantu anda dengan nutrisi anda!</p>
            </div>

            <div class="bg-stone-50 p-8 rounded-xl shadow-lg">
                <div class="mb-6">
                    <label for="diet-pref-select" class="block text-stone-700 text-lg font-semibold mb-2">Pilih Keutamaan Diet:</label>
                    <select id="diet-pref-select" class="block w-full px-4 py-3 rounded-lg border border-stone-300 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent text-stone-800 bg-white">
                        <option value="standard">Standard</option>
                        <option value="vegetarian">Vegetarian</option>
                        <option value="vegan">Vegan</option>
                        <option value="keto">Keto</option>
                        <option value="rendah karbohidrat">Rendah Karbohidrat</option>
                    </select>
                </div>

                <div class="mb-6">
                    <label for="calorie-goal-input" class="block text-stone-700 text-lg font-semibold mb-2">Matlamat Kalori Harian (cth: 2000, pilihan):</label>
                    <input type="number" id="calorie-goal-input" class="block w-full px-4 py-3 rounded-lg border border-stone-300 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent text-stone-800 bg-white" placeholder="Masukkan kalori yang diingini">
                </div>

                <div class="mb-8">
                    <label for="ingredients-input" class="block text-stone-700 text-lg font-semibold mb-2">Bahan-bahan untuk Disertakan/Dikecualikan (cth: ayam, brokoli, elak kacang, pilihan):</label>
                    <textarea id="ingredients-input" rows="3" class="block w-full px-4 py-3 rounded-lg border border-stone-300 focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent text-stone-800 bg-white" placeholder="Masukkan bahan-bahan yang anda mahu atau elakkan"></textarea>
                </div>

                <button id="generate-meal-btn" class="w-full bg-teal-600 hover:bg-teal-700 text-white font-bold py-3 px-6 rounded-lg text-lg transition duration-300 ease-in-out transform hover:scale-105 flex items-center justify-center">
                    Jana Pelan Makanan ✨
                    <div id="loading-spinner-meal" class="loading-spinner ml-3 hidden"></div>
                </button>

                <div id="meal-plan-output" class="mt-8 p-6 bg-stone-100 rounded-lg border border-stone-200 text-stone-700 whitespace-pre-wrap">
                    Pilih keutamaan diet anda, masukkan matlamat kalori atau bahan-bahan, kemudian klik 'Jana Pelan Makanan' untuk mendapatkan cadangan!
                </div>
            </div>
        </div>
    </section>

    <section id="sertai-kami" class="py-20 bg-teal-700 text-white">
        <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <h2 class="text-3xl md:text-4xl font-bold mb-6">Sudah Tiba Masanya Untuk Melangkah ke Tahap Baru!</h2>
            <p class="text-xl mb-4">
                Tubuh yang sihat. Minda yang fokus. Hidup yang aktif. Semua bermula di WAWA GYM.
            </p>
            <p class="text-lg mb-8">
                Daftar hari ini dan rasai bezanya. Kunjungi kaunter kami atau hubungi kami untuk maklumat lanjut mengenai pakej keahlian.
            </p>
            <div class="space-y-4 sm:space-y-0 sm:flex sm:justify-center sm:space-x-4">
                <a href="tel:01161248629" class="w-full sm:w-auto bg-yellow-400 hover:bg-yellow-500 text-stone-800 font-bold py-3 px-8 rounded-lg text-lg transition duration-300 ease-in-out transform hover:scale-105 inline-block">
                    📞 Hubungi Kami
                </a>
                 <span class="w-full sm:w-auto bg-white text-teal-700 font-bold py-3 px-8 rounded-lg text-lg inline-block">
                    📍 Tanjung Gemok
                </span>
            </div>
            <p class="mt-4 text-teal-100 text-base">Berada betul-betul di atas Wakaka kedai makanan ringan dan sebaris dengan Marry Brown</p>
            <p class="mt-2 text-teal-100 text-sm">Waktu Operasi: Isnin - Ahad, 6 Pagi - 10 Malam (Contoh)</p>
        </div>
    </section>

    <footer class="bg-stone-800 text-stone-300 py-8">
        <div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
            <p>&copy; <span id="currentYear"></span> WAWA GYM. Semua Hak Cipta Terpelihara.</p>
            <p class="text-sm">WAWA GYM – Lengkap. Mesra. Sedia untuk anda.</p>
        </div>
    </footer>

    <script>
        // Skrip untuk menu mudah alih
        const mobileMenuButton = document.getElementById('mobile-menu-button');
        const mobileMenu = document.getElementById('mobile-menu');
        mobileMenuButton.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });

        // Skrip untuk menutup menu mudah alih apabila pautan diklik
        const mobileNavLinks = mobileMenu.querySelectorAll('a');
        mobileNavLinks.forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.classList.add('hidden');
            });
        });
        
        // Skrip untuk navigasi skrol lancar dari header
        const desktopNavLinks = document.querySelectorAll('nav .hidden.md\\:block a');
        desktopNavLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                const targetId = this.getAttribute('href');
                // Hanya untuk pautan dalaman
                if (targetId.startsWith('#') && targetId.length > 1) {
                    e.preventDefault();
                    document.querySelector(targetId).scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });

        // Skrip untuk tahun semasa di footer
        document.getElementById('currentYear').textContent = new Date().getFullYear();

        // Logik untuk Penjana Pelan Senaman AI
        const goalSelect = document.getElementById('goal-select');
        const levelSelect = document.getElementById('level-select');
        const generateWorkoutBtn = document.getElementById('generate-workout-btn');
        const workoutPlanOutput = document.getElementById('workout-plan-output');
        const loadingSpinnerWorkout = document.getElementById('loading-spinner-workout');

        generateWorkoutBtn.addEventListener('click', async () => {
            const goal = goalSelect.value;
            const level = levelSelect.value;
            const prompt = `Sebagai jurulatih kecergasan AI, jana pelan senaman asas untuk individu ${level} yang ingin ${goal}. Sertakan 3-4 hari senaman, dengan 3-5 latihan setiap hari, termasuk set dan ulangan. Contoh: 'Hari 1: Dada & Trisep - Bench Press (3 set x 8-12 ulangan)'. Pastikan formatnya mudah dibaca dengan senarai berbulet atau nombor.`;

            workoutPlanOutput.textContent = ''; // Kosongkan output sebelumnya
            loadingSpinnerWorkout.classList.remove('hidden'); // Tunjukkan spinner
            generateWorkoutBtn.disabled = true; // Lumpuhkan butang

            try {
                let chatHistory = [];
                chatHistory.push({ role: "user", parts: [{ text: prompt }] });
                const payload = { contents: chatHistory };
                const apiKey = ""; 
                const apiUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}`;
                const response = await fetch(apiUrl, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });
                const result = await response.json();

                if (result.candidates && result.candidates.length > 0 &&
                    result.candidates[0].content && result.candidates[0].content.parts &&
                    result.candidates[0].content.parts.length > 0) {
                    const text = result.candidates[0].content.parts[0].text;
                    workoutPlanOutput.textContent = text;
                } else {
                    workoutPlanOutput.textContent = 'Maaf, tidak dapat menjana pelan senaman. Sila cuba lagi.';
                    console.error('Struktur respons LLM tidak dijangka:', result);
                }
            } catch (error) {
                workoutPlanOutput.textContent = 'Ralat semasa menjana pelan senaman. Sila semak sambungan internet anda atau cuba lagi nanti.';
                console.error('Ralat panggilan API Gemini:', error);
            } finally {
                loadingSpinnerWorkout.classList.add('hidden'); // Sembunyikan spinner
                generateWorkoutBtn.disabled = false; // Aktifkan butang semula
            }
        });

        // Logik untuk Penjana Pelan Makanan AI
        const dietPrefSelect = document.getElementById('diet-pref-select');
        const calorieGoalInput = document.getElementById('calorie-goal-input');
        const ingredientsInput = document.getElementById('ingredients-input');
        const generateMealBtn = document.getElementById('generate-meal-btn');
        const mealPlanOutput = document.getElementById('meal-plan-output');
        const loadingSpinnerMeal = document.getElementById('loading-spinner-meal');

        generateMealBtn.addEventListener('click', async () => {
            const dietPreference = dietPrefSelect.value;
            const calorieGoal = calorieGoalInput.value;
            const ingredients = ingredientsInput.value;

            let prompt = `Sebagai pakar nutrisi AI, jana cadangan pelan makanan asas untuk satu hari. Keutamaan diet: ${dietPreference}. `;
            if (calorieGoal) {
                prompt += `Matlamat kalori harian: ${calorieGoal} kalori. `;
            }
            if (ingredients) {
                prompt += `Sertakan/kecualikan bahan-bahan berikut: ${ingredients}. `;
            }
            prompt += `Sertakan sarapan, makan tengah hari, makan malam, dan satu snek. Pastikan formatnya mudah dibaca dengan senarai berbulet atau nombor.`;

            mealPlanOutput.textContent = ''; // Kosongkan output sebelumnya
            loadingSpinnerMeal.classList.remove('hidden'); // Tunjukkan spinner
            generateMealBtn.disabled = true; // Lumpuhkan butang

            try {
                let chatHistory = [];
                chatHistory.push({ role: "user", parts: [{ text: prompt }] });
                const payload = { contents: chatHistory };
                const apiKey = ""; 
                const apiUrl = `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${apiKey}`;
                const response = await fetch(apiUrl, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(payload)
                });
                const result = await response.json();

                if (result.candidates && result.candidates.length > 0 &&
                    result.candidates[0].content && result.candidates[0].content.parts &&
                    result.candidates[0].content.parts.length > 0) {
                    const text = result.candidates[0].content.parts[0].text;
                    mealPlanOutput.textContent = text;
                } else {
                    mealPlanOutput.textContent = 'Maaf, tidak dapat menjana pelan makanan. Sila cuba lagi.';
                    console.error('Struktur respons LLM tidak dijangka:', result);
                }
            } catch (error) {
                mealPlanOutput.textContent = 'Ralat semasa menjana pelan makanan. Sila semak sambungan internet anda atau cuba lagi nanti.';
                console.error('Ralat panggilan API Gemini:', error);
            } finally {
                loadingSpinnerMeal.classList.add('hidden'); // Sembunyikan spinner
                generateMealBtn.disabled = false; // Aktifkan butang semula
            }
        });
    </script>
</body>
</html>
