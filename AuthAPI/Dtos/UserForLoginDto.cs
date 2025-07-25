using System.ComponentModel.DataAnnotations;

namespace AuthAPI.Dtos
{
    public class UserForLoginDto
    {
        [Required(ErrorMessage = "Email is required.")]
        [EmailAddress(ErrorMessage = "Please enter a valid email address.")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Password is required.")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "Password is required.")]
        public string Password { get; set; } = string.Empty;
    }
}