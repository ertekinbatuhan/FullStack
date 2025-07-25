namespace AuthAPI.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string Email { get; set; } = string.Empty;
        public byte[] PasswordHash { get; set; } = [];
        public byte[] PasswordSalt { get; set; } = [];
        
        // Email verification properties
        public bool IsEmailVerified { get; set; } = false;
        public string? EmailVerificationToken { get; set; }
        public DateTime? EmailVerificationTokenExpires { get; set; }
        
        // Password reset properties
        public string? PasswordResetToken { get; set; }
        public DateTime? PasswordResetTokenExpires { get; set; }
        
        // Account deletion properties
        public string? AccountDeletionToken { get; set; }
        public DateTime? AccountDeletionTokenExpires { get; set; }
        public bool IsMarkedForDeletion { get; set; } = false;
        public DateTime? DeletionScheduledAt { get; set; }
        
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }
}