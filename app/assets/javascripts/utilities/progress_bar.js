document.addEventListener('turbolinks:load', function () {
    const progressBar = document.querySelector('.progress-bar');
    const { progress } = progressBar.dataset;

    progressBar.style.width = `${progress}%`;
});
