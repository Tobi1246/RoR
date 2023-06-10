document.addEventListener('turbo:load', function() {
  
  const timer = document.querySelector('.timer')

  if (timer) {
    let timerPoints = timer.dataset.leftTimeScore

    setInterval(function() {
      if (timerPoints > 0) {
        timerPoints--
      } else {
        document.querySelector('#next > input').click()
      }

    timer.innerHTML = `${Math.floor(timerPoints / 60)}:${timerPoints < 10 ? '0' : ''}${timerPoints % 60} `
  }, 1000 )
  }
})
