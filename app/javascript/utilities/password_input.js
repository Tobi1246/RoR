document.addEventListener('turbo:load', function() {

  const form = document.getElementById('new_user')
  const confirmPassword = document.getElementById('user_password_confirmation')

  if (form && confirmPassword) {

    const password = form.user_password
    const passwordCheck = document.getElementById('password-check')
  
    confirmPassword.addEventListener('input', function() {
      if (confirmPassword.value === '') {
        passwordCheck.innerHTML = '';
        return;
      }

      if (password.value === confirmPassword.value) {
        passwordCheck.innerHTML = '<div class="alert alert-success">passwords match</div>'
      } else {
        passwordCheck.innerHTML = `<div class="alert alert-danger">passwords don't match</div>`
      }

    })
  }
})

