using System.ComponentModel.DataAnnotations;

namespace AuthAPI.Dtos
{
    public class ConfirmAccountDeletionDto
    {
        [Required(ErrorMessage = "Deletion token is required.")]
        public string Token { get; set; } = string.Empty;
    }
}