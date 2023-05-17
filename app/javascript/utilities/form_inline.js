document.addEventListener('turbo:load', function() {

  $('.form-inline-link').on('click', formInLineLinkHandler)

  const errors = document.querySelector('.resource-errors')

  if (errors) {
    let resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  } 
})

function formInLineLinkHandler(event) {
  event.preventDefault()
  let testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')

  let $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  let $formInLine = $('.form-inline[data-test-id="' + testId + '"]')

  $formInLine.toggle()
  $testTitle.toggle()

  if (link) {
    if ($formInLine.is(':visible')) {
      link.textContent = 'Cancel'
    } else {
      link.textContent = 'Edit'    
    }
  }
}
