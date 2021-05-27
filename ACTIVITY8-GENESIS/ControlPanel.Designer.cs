
namespace ACTIVITY8_GENESIS
{
    partial class ControlPanel
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.btnSearchBooks = new System.Windows.Forms.Button();
            this.btnAddABook = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnSearchBooks
            // 
            this.btnSearchBooks.Location = new System.Drawing.Point(434, 214);
            this.btnSearchBooks.Name = "btnSearchBooks";
            this.btnSearchBooks.Size = new System.Drawing.Size(136, 23);
            this.btnSearchBooks.TabIndex = 3;
            this.btnSearchBooks.Text = "Search Books";
            this.btnSearchBooks.UseVisualStyleBackColor = true;
            this.btnSearchBooks.Click += new System.EventHandler(this.btnSearchBooks_Click);
            // 
            // btnAddABook
            // 
            this.btnAddABook.Location = new System.Drawing.Point(231, 214);
            this.btnAddABook.Name = "btnAddABook";
            this.btnAddABook.Size = new System.Drawing.Size(147, 23);
            this.btnAddABook.TabIndex = 2;
            this.btnAddABook.Text = "Add a Book";
            this.btnAddABook.UseVisualStyleBackColor = true;
            this.btnAddABook.Click += new System.EventHandler(this.btnAddABook_Click);
            // 
            // ControlPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnSearchBooks);
            this.Controls.Add(this.btnAddABook);
            this.Name = "ControlPanel";
            this.Text = "ControlPanel";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnSearchBooks;
        private System.Windows.Forms.Button btnAddABook;
    }
}