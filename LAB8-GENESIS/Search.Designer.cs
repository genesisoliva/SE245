
namespace LAB8_GENESIS
{
    partial class Search
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
            this.dgvResults = new System.Windows.Forms.DataGridView();
            this.btnSearch = new System.Windows.Forms.Button();
            this.lblLastName = new System.Windows.Forms.Label();
            this.lblFirstName = new System.Windows.Forms.Label();
            this.txtPhoneNumber = new System.Windows.Forms.TextBox();
            this.txtLastName = new System.Windows.Forms.TextBox();
            this.lblCellPhone = new System.Windows.Forms.Label();
            this.txtCellPhone = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.dgvResults)).BeginInit();
            this.SuspendLayout();
            // 
            // dgvResults
            // 
            this.dgvResults.BackgroundColor = System.Drawing.SystemColors.ActiveBorder;
            this.dgvResults.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvResults.Location = new System.Drawing.Point(14, 175);
            this.dgvResults.Name = "dgvResults";
            this.dgvResults.Size = new System.Drawing.Size(776, 267);
            this.dgvResults.TabIndex = 20;
            this.dgvResults.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvResults_CellContentClick);
            // 
            // btnSearch
            // 
            this.btnSearch.Location = new System.Drawing.Point(319, 132);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(75, 23);
            this.btnSearch.TabIndex = 19;
            this.btnSearch.Text = "Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // lblLastName
            // 
            this.lblLastName.AutoSize = true;
            this.lblLastName.Location = new System.Drawing.Point(292, 11);
            this.lblLastName.Name = "lblLastName";
            this.lblLastName.Size = new System.Drawing.Size(81, 13);
            this.lblLastName.TabIndex = 18;
            this.lblLastName.Text = "Phone Number:";
            // 
            // lblFirstName
            // 
            this.lblFirstName.AutoSize = true;
            this.lblFirstName.Location = new System.Drawing.Point(11, 11);
            this.lblFirstName.Name = "lblFirstName";
            this.lblFirstName.Size = new System.Drawing.Size(61, 13);
            this.lblFirstName.TabIndex = 17;
            this.lblFirstName.Text = "Last Name:";
            // 
            // txtPhoneNumber
            // 
            this.txtPhoneNumber.Location = new System.Drawing.Point(379, 8);
            this.txtPhoneNumber.Name = "txtPhoneNumber";
            this.txtPhoneNumber.Size = new System.Drawing.Size(199, 20);
            this.txtPhoneNumber.TabIndex = 16;
            // 
            // txtLastName
            // 
            this.txtLastName.Location = new System.Drawing.Point(72, 8);
            this.txtLastName.Name = "txtLastName";
            this.txtLastName.Size = new System.Drawing.Size(199, 20);
            this.txtLastName.TabIndex = 15;
            // 
            // lblCellPhone
            // 
            this.lblCellPhone.AutoSize = true;
            this.lblCellPhone.Location = new System.Drawing.Point(297, 51);
            this.lblCellPhone.Name = "lblCellPhone";
            this.lblCellPhone.Size = new System.Drawing.Size(61, 13);
            this.lblCellPhone.TabIndex = 22;
            this.lblCellPhone.Text = "Cell Phone:";
            // 
            // txtCellPhone
            // 
            this.txtCellPhone.Location = new System.Drawing.Point(364, 48);
            this.txtCellPhone.Name = "txtCellPhone";
            this.txtCellPhone.Size = new System.Drawing.Size(199, 20);
            this.txtCellPhone.TabIndex = 21;
            // 
            // Search
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.lblCellPhone);
            this.Controls.Add(this.txtCellPhone);
            this.Controls.Add(this.dgvResults);
            this.Controls.Add(this.btnSearch);
            this.Controls.Add(this.lblLastName);
            this.Controls.Add(this.lblFirstName);
            this.Controls.Add(this.txtPhoneNumber);
            this.Controls.Add(this.txtLastName);
            this.Name = "Search";
            this.Text = "Search";
            ((System.ComponentModel.ISupportInitialize)(this.dgvResults)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvResults;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.Label lblLastName;
        private System.Windows.Forms.Label lblFirstName;
        private System.Windows.Forms.TextBox txtPhoneNumber;
        private System.Windows.Forms.TextBox txtLastName;
        private System.Windows.Forms.Label lblCellPhone;
        private System.Windows.Forms.TextBox txtCellPhone;
    }
}