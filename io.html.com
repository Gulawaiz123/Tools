<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Multimedia Tools - Nawab Gulawaiz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        .hero-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 100px 0;
            position: relative;
            overflow: hidden;
        }

        .hero-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3);
            z-index: 0;
        }

        .hero-section .container {
            position: relative;
            z-index: 1;
        }

        .owner-card {
            max-width: 800px;
            margin: 0 auto;
        }

        .owner-img {
            border: 5px solid white;
            transition: transform 0.3s ease;
        }

        .owner-img:hover {
            transform: scale(1.05);
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            margin-bottom: 20px;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .toolbar {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            align-items: center;
        }

        .canvas-container {
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            margin-bottom: 15px;
        }

        .filter-options {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 15px;
        }

        .progress {
            height: 10px;
        }

        .social-icons a {
            display: inline-block;
            width: 36px;
            height: 36px;
            line-height: 36px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            transition: background-color 0.3s ease;
        }

        .social-icons a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        #editorCanvas {
            background-color: #f5f5f5;
            display: block;
            max-width: 100%;
        }

        .filter-btn.active {
            background-color: var(--primary-color);
            color: white;
        }

        /* Health Banner Styles */
        .health-banner {
            background-color: #f8f9fa;
            border-top: 3px solid #2ecc71;
            border-bottom: 3px solid #2ecc71;
            margin: 30px 0;
        }

        .health-banner h2 {
            font-weight: 800;
            color: #2ecc71;
        }

        .health-banner h3 {
            font-weight: 600;
            color: #2c3e50;
        }

        .health-banner h4 {
            font-weight: 500;
            color: #3498db;
        }

        .health-logo {
            max-height: 100px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .toolbar {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .card {
                margin-bottom: 15px;
            }

            .hero-section {
                padding: 60px 0;
            }
            
            .owner-card .row {
                flex-direction: column;
                text-align: center;
            }
            
            .owner-img {
                margin-bottom: 20px;
                max-width: 150px;
            }

            .health-banner {
                text-align: center;
            }
            .health-banner .col-md-3 {
                margin-bottom: 15px;
            }
        }

        .z-index-1 {
            position: relative;
            z-index: 1;
        }

        .social-icons a {
            display: inline-block;
            width: 36px;
            height: 36px;
            line-height: 36px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .social-icons a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="https://via.placeholder.com/40x40" alt="Logo" class="rounded-circle me-2">
                Multimedia Tools Pro
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="#photo-editor">Photo Editor</a></li>
                    <li class="nav-item"><a class="nav-link" href="#pdf-tools">PDF Tools</a></li>
                    <li class="nav-item"><a class="nav-link" href="#document-converter">Document Converter</a></li>
                    <li class="nav-item"><a class="nav-link" href="#image-converter">Image Converter</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="hero-section text-center py-5 position-relative">
        <div class="container position-relative z-index-1">
            <h1 class="display-4 fw-bold">Advanced Multimedia Tools</h1>
            <p class="lead">Professional tools for all your media conversion and editing needs</p>
            <div class="owner-card mt-5">
                <div class="card border-0 shadow-lg">
                    <div class="card-body p-4">
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <img src="https://via.placeholder.com/200x200" alt="Nawab Gulawaiz" class="img-fluid rounded-circle owner-img shadow">
                            </div>
                            <div class="col-md-8 text-start">
                                <h3 class="mb-3">Nawab Gulawaiz</h3>
                                <p class="text-muted mb-2"><i class="fas fa-briefcase me-2"></i>Owner & Developer</p>
                                <p class="mb-2"><i class="fas fa-phone me-2"></i> <a href="tel:03079504540">0307-9504540</a></p>
                                <p class="mb-2"><i class="fas fa-envelope me-2"></i> <a href="mailto:mayogulawaz@gmail.com">mayogulawaz@gmail.com</a></p>
                                <div class="social-icons mt-3">
                                    <a href="#" class="btn btn-outline-primary btn-sm me-2"><i class="fab fa-facebook-f"></i></a>
                                    <a href="#" class="btn btn-outline-info btn-sm me-2"><i class="fab fa-twitter"></i></a>
                                    <a href="#" class="btn btn-outline-danger btn-sm me-2"><i class="fab fa-instagram"></i></a>
                                    <a href="#" class="btn btn-outline-primary btn-sm"><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero-overlay"></div>
    </header>

    <!-- Health Banner Section -->
    <section class="health-banner py-4">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-3 text-center">
                    <img src="FB_IMG_1748615251994.jpg" alt="Health and Wellbeing" class="img-fluid health-logo">
                </div>
                <div class="col-md-9">
                    <h3 class="mb-2">FOR HEALTH AND WELLBEING OF EVERY CITIZEN</h3>
                    <h2 class="text-primary mb-1">H&WELLBEING</h2>
                    <h4 class="mb-1">OF THE PEOPLE OF PAKISTAN</h4>
                    <p class="mb-0 text-muted">WHO PAI</p>
                </div>
            </div>
        </div>
    </section>

    <main class="container py-5">
        <!-- Photo Editor Section -->
        <section id="photo-editor" class="mb-5">
            <h2 class="mb-4"><i class="fas fa-image me-2"></i>Advanced Photo Editor</h2>
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="canvas-container">
                                <canvas id="editorCanvas" width="700" height="500"></canvas>
                            </div>
                            <div class="toolbar mt-3">
                                <button class="btn btn-outline-primary" id="cropBtn"><i class="fas fa-crop"></i> Crop</button>
                                <button class="btn btn-outline-primary" id="rotateBtn"><i class="fas fa-undo"></i> Rotate</button>
                                <button class="btn btn-outline-primary" id="flipHBtn"><i class="fas fa-arrows-alt-h"></i> Flip H</button>
                                <button class="btn btn-outline-primary" id="flipVBtn"><i class="fas fa-arrows-alt-v"></i> Flip V</button>
                                <input type="range" id="brightnessSlider" min="-100" max="100" value="0" class="form-range">
                                <label for="brightnessSlider">Brightness</label>
                                <input type="range" id="contrastSlider" min="-100" max="100" value="0" class="form-range">
                                <label for="contrastSlider">Contrast</label>
                                <input type="file" id="imageUpload" accept="image/*" class="d-none">
                                <button class="btn btn-primary" id="uploadBtn"><i class="fas fa-upload"></i> Upload Image</button>
                                <button class="btn btn-success" id="downloadBtn"><i class="fas fa-download"></i> Download</button>
                                <button class="btn btn-danger" id="resetBtn"><i class="fas fa-trash"></i> Reset</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Filters</h5>
                            <div class="filter-options">
                                <button class="btn btn-outline-secondary filter-btn" data-filter="none">Original</button>
                                <button class="btn btn-outline-secondary filter-btn" data-filter="grayscale">Grayscale</button>
                                <button class="btn btn-outline-secondary filter-btn" data-filter="sepia">Sepia</button>
                                <button class="btn btn-outline-secondary filter-btn" data-filter="invert">Invert</button>
                                <button class="btn btn-outline-secondary filter-btn" data-filter="blur">Blur</button>
                            </div>
                            <h5 class="card-title mt-3">Advanced Options</h5>
                            <div class="advanced-options">
                                <div class="mb-3">
                                    <label for="textOverlay" class="form-label">Text Overlay</label>
                                    <input type="text" id="textOverlay" class="form-control" placeholder="Enter text">
                                    <div class="mt-2">
                                        <input type="color" id="textColor" value="#000000">
                                        <button class="btn btn-sm btn-outline-primary" id="addTextBtn">Add Text</button>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="drawingTool" class="form-label">Drawing Tool</label>
                                    <select id="drawingTool" class="form-select">
                                        <option value="brush">Brush</option>
                                        <option value="rectangle">Rectangle</option>
                                        <option value="circle">Circle</option>
                                        <option value="line">Line</option>
                                    </select>
                                    <input type="color" id="drawingColor" value="#FF0000" class="mt-2">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- PDF Tools Section -->
        <section id="pdf-tools" class="mb-5">
            <h2 class="mb-4"><i class="fas fa-file-pdf me-2"></i>PDF Tools</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-file-word text-primary mb-3" style="font-size: 3rem;"></i>
                            <h5 class="card-title">PDF to Word</h5>
                            <p class="card-text">Convert PDF documents to editable Word files</p>
                            <input type="file" id="pdfToWordInput" accept=".pdf" class="d-none">
                            <button class="btn btn-primary" id="pdfToWordBtn">Select PDF</button>
                            <div class="progress mt-3 d-none" id="pdfToWordProgress">
                                <div class="progress-bar" role="progressbar" style="width: 0%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-file-pdf text-danger mb-3" style="font-size: 3rem;"></i>
                            <h5 class="card-title">Word to PDF</h5>
                            <p class="card-text">Convert Word documents to PDF format</p>
                            <input type="file" id="wordToPdfInput" accept=".doc,.docx" class="d-none">
                            <button class="btn btn-primary" id="wordToPdfBtn">Select Word File</button>
                            <div class="progress mt-3 d-none" id="wordToPdfProgress">
                                <div class="progress-bar" role="progressbar" style="width: 0%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-image text-success mb-3" style="font-size: 3rem;"></i>
                            <h5 class="card-title">PDF to JPG</h5>
                            <p class="card-text">Convert PDF pages to JPG images</p>
                            <input type="file" id="pdfToJpgInput" accept=".pdf" class="d-none">
                            <button class="btn btn-primary" id="pdfToJpgBtn">Select PDF</button>
                            <div class="progress mt-3 d-none" id="pdfToJpgProgress">
                                <div class="progress-bar" role="progressbar" style="width: 0%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Additional Tools Section -->
        <section id="additional-tools" class="mb-5">
            <h2 class="mb-4"><i class="fas fa-tools me-2"></i>Additional Tools</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Image Converter</h5>
                            <div class="image-converter">
                                <input type="file" id="imageConvertInput" accept="image/*" class="d-none">
                                <button class="btn btn-primary mb-3" id="imageConvertBtn">Select Image</button>
                                <div class="form-group">
                                    <label for="imageFormatSelect">Convert to:</label>
                                    <select id="imageFormatSelect" class="form-select">
                                        <option value="jpg">JPG</option>
                                        <option value="png">PNG</option>
                                        <option value="webp">WebP</option>
                                        <option value="bmp">BMP</option>
                                        <option value="gif">GIF</option>
                                    </select>
                                </div>
                                <button class="btn btn-success mt-3" id="convertImageBtn">Convert</button>
                                <div class="preview-container mt-3 text-center">
                                    <img id="imageConvertPreview" class="img-fluid d-none">
                                </div>
                                <a id="imageConvertDownload" class="btn btn-primary mt-3 d-none" download>
                                    <i class="fas fa-download"></i> Download Converted Image
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h5 class="card-title">Document Tools</h5>
                            <div class="document-tools">
                                <div class="mb-3">
                                    <label class="form-label">Merge PDFs</label>
                                    <input type="file" id="mergePdfInput" accept=".pdf" multiple class="d-none">
                                    <button class="btn btn-primary" id="mergePdfBtn">Select PDFs to Merge</button>
                                    <div id="mergePdfFiles" class="mt-2"></div>
                                    <button class="btn btn-success mt-2 d-none" id="mergePdfProcessBtn">Merge PDFs</button>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Compress PDF</label>
                                    <input type="file" id="compressPdfInput" accept=".pdf" class="d-none">
                                    <button class="btn btn-primary" id="compressPdfBtn">Select PDF to Compress</button>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Split PDF</label>
                                    <input type="file" id="splitPdfInput" accept=".pdf" class="d-none">
                                    <button class="btn btn-primary" id="splitPdfBtn">Select PDF to Split</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="bg-dark text-white py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>About Us</h5>
                    <p>Professional multimedia tools developed by Nawab Gulawaiz to help you with all your document and image conversion needs.</p>
                </div>
                <div class="col-md-6">
                    <h5>Contact Information</h5>
                    <ul class="list-unstyled">
                        <li><i class="fas fa-user me-2"></i> Nawab Gulawaiz</li>
                        <li><i class="fas fa-phone me-2"></i> <a href="tel:03079504540" class="text-white">0307-9504540</a></li>
                        <li><i class="fas fa-envelope me-2"></i> <a href="mailto:mayogulawaz@gmail.com" class="text-white">mayogulawaz@gmail.com</a></li>
                    </ul>
                </div>
            </div>
            <hr class="my-4 bg-light">
            <div class="text-center">
                <p class="mb-0">© 2023 Advanced Multimedia Tools. All rights reserved.</p>
                <p class="mb-0">Developed and maintained by Nawab Gulawaiz</p>
            </div>
        </div>
    </footer>

    <!-- Modals -->
    <div class="modal fade" id="resultModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Conversion Complete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p id="resultMessage">Your file has been processed successfully!</p>
                </div>
                <div class="modal-footer">
                    <a id="resultDownload" class="btn btn-primary" download>Download</a>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf-lib/1.17.1/pdf-lib.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize tooltips
            const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            const tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });

            // Photo Editor Functionality
            const canvas = document.getElementById('editorCanvas');
            const ctx = canvas.getContext('2d');
            let currentImage = null;
            let isDrawing = false;
            let lastX = 0;
            let lastY = 0;
            let currentTool = 'brush';
            let textOverlay = null;

            // Set PDF.js worker path
            pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.worker.min.js';

            // Upload Image
            document.getElementById('uploadBtn').addEventListener('click', function() {
                document.getElementById('imageUpload').click();
            });

            document.getElementById('imageUpload').addEventListener('change', function(e) {
                if (e.target.files && e.target.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(event) {
                        const img = new Image();
                        img.onload = function() {
                            // Reset canvas dimensions to match image
                            canvas.width = img.width;
                            canvas.height = img.height;
                            ctx.drawImage(img, 0, 0);
                            currentImage = img;
                        };
                        img.src = event.target.result;
                    };
                    reader.readAsDataURL(e.target.files[0]);
                }
            });

            // Download Image
            document.getElementById('downloadBtn').addEventListener('click', function() {
                if (!currentImage) {
                    alert('Please upload an image first');
                    return;
                }
                const link = document.createElement('a');
                link.download = 'edited-image.png';
                link.href = canvas.toDataURL('image/png');
                link.click();
            });

            // Reset Image
            document.getElementById('resetBtn').addEventListener('click', function() {
                if (currentImage) {
                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                    ctx.drawImage(currentImage, 0, 0);
                }
            });

            // Crop Tool
            document.getElementById('cropBtn').addEventListener('click', function() {
                alert('Crop functionality would be implemented here');
                // In a real implementation, this would allow selecting a crop area
            });

            // Rotate Image
            document.getElementById('rotateBtn').addEventListener('click', function() {
                if (!currentImage) return;
                
                // Create a temporary canvas to rotate the image
                const tempCanvas = document.createElement('canvas');
                const tempCtx = tempCanvas.getContext('2d');
                
                // Swap width and height
                tempCanvas.width = canvas.height;
                tempCanvas.height = canvas.width;
                
                // Rotate and draw
                tempCtx.translate(tempCanvas.width / 2, tempCanvas.height / 2);
                tempCtx.rotate(Math.PI / 2);
                tempCtx.drawImage(canvas, -canvas.width / 2, -canvas.height / 2);
                
                // Update main canvas
                canvas.width = tempCanvas.width;
                canvas.height = tempCanvas.height;
                ctx.drawImage(tempCanvas, 0, 0);
            });

            // Flip Horizontal
            document.getElementById('flipHBtn').addEventListener('click', function() {
                if (!currentImage) return;
                
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.save();
                ctx.scale(-1, 1);
                ctx.drawImage(currentImage, -canvas.width, 0);
                ctx.restore();
            });

            // Flip Vertical
            document.getElementById('flipVBtn').addEventListener('click', function() {
                if (!currentImage) return;
                
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.save();
                ctx.scale(1, -1);
                ctx.drawImage(currentImage, 0, -canvas.height);
                ctx.restore();
            });

            // Brightness and Contrast
            document.getElementById('brightnessSlider').addEventListener('input', applyFilters);
            document.getElementById('contrastSlider').addEventListener('input', applyFilters);

            function applyFilters() {
                if (!currentImage) return;
                
                const brightness = document.getElementById('brightnessSlider').value;
                const contrast = document.getElementById('contrastSlider').value;
                
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.drawImage(currentImage, 0, 0);
                
                // Apply brightness and contrast
                const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
                const data = imageData.data;
                
                const factor = (259 * (255 + contrast)) / (255 * (259 - contrast));
                
                for (let i = 0; i < data.length; i += 4) {
                    // Apply brightness
                    data[i] = parseInt(data[i]) + parseInt(brightness);
                    data[i+1] = parseInt(data[i+1]) + parseInt(brightness);
                    data[i+2] = parseInt(data[i+2]) + parseInt(brightness);
                    
                    // Apply contrast
                    data[i] = factor * (data[i] - 128) + 128;
                    data[i+1] = factor * (data[i+1] - 128) + 128;
                    data[i+2] = factor * (data[i+2] - 128) + 128;
                    
                    // Clamp values between 0-255
                    data[i] = Math.max(0, Math.min(255, data[i]));
                    data[i+1] = Math.max(0, Math.min(255, data[i+1]));
                    data[i+2] = Math.max(0, Math.min(255, data[i+2]));
                }
                
                ctx.putImageData(imageData, 0, 0);
            }

            // Filter Buttons
            document.querySelectorAll('.filter-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    const filter = this.getAttribute('data-filter');
                    applyImageFilter(filter);
                    
                    // Update active state
                    document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
                    this.classList.add('active');
                });
            });

            function applyImageFilter(filter) {
                if (!currentImage) return;
                
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.drawImage(currentImage, 0, 0);
                
                const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
                const data = imageData.data;
                
                switch(filter) {
                    case 'grayscale':
                        for (let i = 0; i < data.length; i += 4) {
                            const avg = (data[i] + data[i+1] + data[i+2]) / 3;
                            data[i] = avg;
                            data[i+1] = avg;
                            data[i+2] = avg;
                        }
                        break;
                    case 'sepia':
                        for (let i = 0; i < data.length; i += 4) {
                            const r = data[i];
                            const g = data[i+1];
                            const b = data[i+2];
                            
                            data[i] = Math.min(255, (r * 0.393) + (g * 0.769) + (b * 0.189));
                            data[i+1] = Math.min(255, (r * 0.349) + (g * 0.686) + (b * 0.168));
                            data[i+2] = Math.min(255, (r * 0.272) + (g * 0.534) + (b * 0.131));
                        }
                        break;
                    case 'invert':
                        for (let i = 0; i < data.length; i += 4) {
                            data[i] = 255 - data[i];
                            data[i+1] = 255 - data[i+1];
                            data[i+2] = 255 - data[i+2];
                        }
                        break;
                    case 'blur':
                        // Simple box blur implementation
                        const tempCanvas = document.createElement('canvas');
                        const tempCtx = tempCanvas.getContext('2d');
                        tempCanvas.width = canvas.width;
                        tempCanvas.height = canvas.height;
                        tempCtx.drawImage(canvas, 0, 0);
                        
                        ctx.filter = 'blur(5px)';
                        ctx.drawImage(tempCanvas, 0, 0);
                        ctx.filter = 'none';
                        break;
                    default:
                        // No filter or 'none'
                        break;
                }
                
                ctx.putImageData(imageData, 0, 0);
            }

            // Text Overlay
            document.getElementById('addTextBtn').addEventListener('click', function() {
                const text = document.getElementById('textOverlay').value;
                const color = document.getElementById('textColor').value;
                
                if (!text) return;
                
                ctx.font = '30px Arial';
                ctx.fillStyle = color;
                ctx.fillText(text, 20, 50);
                
                textOverlay = { text, color, x: 20, y: 50 };
            });

            // Drawing Tools
            document.getElementById('drawingTool').addEventListener('change', function() {
                currentTool = this.value;
            });

            canvas.addEventListener('mousedown', startDrawing);
            canvas.addEventListener('mousemove', draw);
            canvas.addEventListener('mouseup', stopDrawing);
            canvas.addEventListener('mouseout', stopDrawing);

            function startDrawing(e) {
                if (currentTool === 'none') return;
                
                isDrawing = true;
                [lastX, lastY] = [e.offsetX, e.offsetY];
            }

            function draw(e) {
                if (!isDrawing) return;
                
                const color = document.getElementById('drawingColor').value;
                ctx.strokeStyle = color;
                ctx.fillStyle = color;
                ctx.lineWidth = 5;
                ctx.lineCap = 'round';
                
                switch(currentTool) {
                    case 'brush':
                        ctx.beginPath();
                        ctx.moveTo(lastX, lastY);
                        ctx.lineTo(e.offsetX, e.offsetY);
                        ctx.stroke();
                        [lastX, lastY] = [e.offsetX, e.offsetY];
                        break;
                    case 'rectangle':
                        // Clear and redraw image
                        ctx.clearRect(0, 0, canvas.width, canvas.height);
                        if (currentImage) ctx.drawImage(currentImage, 0, 0);
                        
                        // Draw rectangle
                        ctx.beginPath();
                        ctx.rect(lastX, lastY, e.offsetX - lastX, e.offsetY - lastY);
                        ctx.stroke();
                        break;
                    case 'circle':
                        // Clear and redraw image
                        ctx.clearRect(0, 0, canvas.width, canvas.height);
                        if (currentImage) ctx.drawImage(currentImage, 0, 0);
                        
                        // Draw circle
                        const radius = Math.sqrt(Math.pow(e.offsetX - lastX, 2) + Math.pow(e.offsetY - lastY, 2));
                        ctx.beginPath();
                        ctx.arc(lastX, lastY, radius, 0, Math.PI * 2);
                        ctx.stroke();
                        break;
                    case 'line':
                        // Clear and redraw image
                        ctx.clearRect(0, 0, canvas.width, canvas.height);
                        if (currentImage) ctx.drawImage(currentImage, 0, 0);
                        
                        // Draw line
                        ctx.beginPath();
                        ctx.moveTo(lastX, lastY);
                        ctx.lineTo(e.offsetX, e.offsetY);
                        ctx.stroke();
                        break;
                }
            }

            function stopDrawing() {
                isDrawing = false;
            }

            // PDF to Word Conversion
            document.getElementById('pdfToWordBtn').addEventListener('click', function() {
                document.getElementById('pdfToWordInput').click();
            });

            document.getElementById('pdfToWordInput').addEventListener('change', function(e) {
                if (e.target.files && e.target.files[0]) {
                    const progressBar = document.getElementById('pdfToWordProgress');
                    progressBar.classList.remove('d-none');
                    progressBar.querySelector('.progress-bar').style.width = '0%';
                    
                    // Simulate conversion process
                    let progress = 0;
                    const interval = setInterval(() => {
                        progress += 10;
                        progressBar.querySelector('.progress-bar').style.width = `${progress}%`;
                        
                        if (progress >= 100) {
                            clearInterval(interval);
                            showResult('PDF to Word conversion complete!', 'converted.docx');
                        }
                    }, 300);
                }
            });

            // Word to PDF Conversion
            document.getElementById('wordToPdfBtn').addEventListener('click', function() {
                document.getElementById('wordToPdfInput').click();
            });

            document.getElementById('wordToPdfInput').addEventListener('change', function(e) {
                if (e.target.files && e.target.files[0]) {
                    const progressBar = document.getElementById('wordToPdfProgress');
                    progressBar.classList.remove('d-none');
                    progressBar.querySelector('.progress-bar').style.width = '0%';
                    
                    // Simulate conversion process
                    let progress = 0;
                    const interval = setInterval(() => {
                        progress += 10;
                        progressBar.querySelector('.progress-bar').style.width = `${progress}%`;
                        
                        if (progress >= 100) {
                            clearInterval(interval);
                            showResult('Word to PDF conversion complete!', 'converted.pdf');
                        }
                    }, 300);
                }
            });

            // PDF to JPG Conversion
            document.getElementById('pdfToJpgBtn').addEventListener('
