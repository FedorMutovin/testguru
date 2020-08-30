document.addEventListener('turbolinks:load', function () {
    const progressBar = document.querySelector('.progress-bar');
    console.log(typeof progressBar)
    const { progress } = progressBar.dataset;

    progressBar.style.width = `${progress}%`;
});