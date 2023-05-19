document.addEventListener('turbo:load', function() {

  const progressBar = document.querySelector('.progressBar')
  if (progressBar){
    progress()
  }
    function progress() {
      let currentQuestion = progressBar.dataset.currentQuestion
      let countQuestion = progressBar.dataset.countQuestion
      progressBar.setAttribute('max', countQuestion)
      progressBar.setAttribute('value', currentQuestion)
    }
})
