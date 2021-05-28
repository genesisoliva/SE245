
namespace LAB8_GENESIS
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
            this.btnAddAPerson = new System.Windows.Forms.Button();
            this.btnSearchPersons = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnAddAPerson
            // 
            this.btnAddAPerson.Location = new System.Drawing.Point(110, 68);
            this.btnAddAPerson.Name = "btnAddAPerson";
            this.btnAddAPerson.Size = new System.Drawing.Size(75, 23);
            this.btnAddAPerson.TabIndex = 0;
            this.btnAddAPerson.Text = "Add";
            this.btnAddAPerson.UseVisualStyleBackColor = true;
            this.btnAddAPerson.Click += new System.EventHandler(this.btnAddAPerson_Click);
            // 
            // btnSearchPersons
            // 
            this.btnSearchPersons.Location = new System.Drawing.Point(241, 68);
            this.btnSearchPersons.Name = "btnSearchPersons";
            this.btnSearchPersons.Size = new System.Drawing.Size(75, 23);
            this.btnSearchPersons.TabIndex = 1;
            this.btnSearchPersons.Text = "Search";
            this.btnSearchPersons.UseVisualStyleBackColor = true;
            this.btnSearchPersons.Click += new System.EventHandler(this.btnSearchPersons_Click);
            // 
            // ControlPanel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Control;
            this.ClientSize = new System.Drawing.Size(484, 193);
            this.Controls.Add(this.btnSearchPersons);
            this.Controls.Add(this.btnAddAPerson);
            this.ForeColor = System.Drawing.SystemColors.ControlText;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.SizableToolWindow;
            this.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.Name = "ControlPanel";
            this.Text = "Control Panel";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnAddAPerson;
        private System.Windows.Forms.Button btnSearchPersons;
    }
}