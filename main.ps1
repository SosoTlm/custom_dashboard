Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a form for the dashboard
$form = New-Object System.Windows.Forms.Form
$form.Text = "Performance Dashboard"
$form.BackColor = '#202E3D'
$form.ForeColor = 'White'
$form.Width = 600
$form.Height = 400
$form.StartPosition = 'CenterScreen'

# Set form font
$form.Font = New-Object System.Drawing.Font('Arial', 12)

# Title label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Performance Dashboard"
$titleLabel.Font = New-Object System.Drawing.Font('Arial', 24, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = '#29AFFF'
$titleLabel.Width = 550
$titleLabel.Height = 40
$titleLabel.TextAlign = 'MiddleCenter'
$titleLabel.Location = New-Object System.Drawing.Point(25, 10)
$form.Controls.Add($titleLabel)

# Function to create labels for metrics
function Add-MetricLabel {
    param (
        [string]$Text,
        [int]$Top
    )
    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Text
    $label.Width = 500
    $label.Height = 30
    $label.Top = $Top
    $label.Left = 50
    $label.ForeColor = '#FFCE00'
    $form.Controls.Add($label)
    return $label
}

# Labels for metrics
$fpsLabel = Add-MetricLabel -Text "FPS: Calculating..." -Top 80
$pingLabel = Add-MetricLabel -Text "Ping: Calculating..." -Top 120
$cpuLabel = Add-MetricLabel -Text "CPU Usage: Calculating..." -Top 160
$gpuLabel = Add-MetricLabel -Text "GPU Usage: Not Available" -Top 200
$batteryLabel = Add-MetricLabel -Text "Battery: Calculating..." -Top 240

# FPS calculation (mocked)
Start-Job -ScriptBlock {
    while ($true) {
        Start-Sleep -Milliseconds 1000
        [System.Windows.Forms.Control]::Invoke($fpsLabel, [Action]{ $fpsLabel.Text = "FPS: $((Get-Random -Minimum 30 -Maximum 120))" })
    }
}

# Ping calculation
Start-Job -ScriptBlock {
    while ($true) {
        $start = Get-Date
        try {
            Test-Connection -ComputerName "google.com" -Count 1 -ErrorAction Stop | Out-Null
            $pingTime = (Get-Date) - $start
            [System.Windows.Forms.Control]::Invoke($pingLabel, [Action]{ $pingLabel.Text = "Ping: {0} ms" -f $pingTime.Milliseconds })
        } catch {
            [System.Windows.Forms.Control]::Invoke($pingLabel, [Action]{ $pingLabel.Text = "Ping: Error" })
        }
        Start-Sleep -Seconds 5
    }
}

# CPU Usage
Start-Job -ScriptBlock {
    while ($true) {
        $cpu = (Get-Counter '\\Processor(_Total)\\% Processor Time').CounterSamples.CookedValue
        [System.Windows.Forms.Control]::Invoke($cpuLabel, [Action]{ $cpuLabel.Text = "CPU Usage: {0:N2}%" -f $cpu })
        Start-Sleep -Seconds 2
    }
}

# Battery Status
Start-Job -ScriptBlock {
    while ($true) {
        try {
            $battery = (Get-WmiObject Win32_Battery).EstimatedChargeRemaining
            [System.Windows.Forms.Control]::Invoke($batteryLabel, [Action]{ $batteryLabel.Text = "Battery: {0}%" -f $battery })
        } catch {
            [System.Windows.Forms.Control]::Invoke($batteryLabel, [Action]{ $batteryLabel.Text = "Battery: Not Available" })
        }
        Start-Sleep -Seconds 60
    }
}

# Show form
[System.Windows.Forms.Application]::EnableVisualStyles()
$form.ShowDialog()
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a form for the dashboard
$form = New-Object System.Windows.Forms.Form
$form.Text = "Performance Dashboard"
$form.BackColor = '#202E3D'
$form.ForeColor = 'White'
$form.Width = 600
$form.Height = 400
$form.StartPosition = 'CenterScreen'

# Set form font
$form.Font = New-Object System.Drawing.Font('Arial', 12)

# Title label
$titleLabel = New-Object System.Windows.Forms.Label
$titleLabel.Text = "Performance Dashboard"
$titleLabel.Font = New-Object System.Drawing.Font('Arial', 24, [System.Drawing.FontStyle]::Bold)
$titleLabel.ForeColor = '#29AFFF'
$titleLabel.Width = 550
$titleLabel.Height = 40
$titleLabel.TextAlign = 'MiddleCenter'
$titleLabel.Location = New-Object System.Drawing.Point(25, 10)
$form.Controls.Add($titleLabel)

# Function to create labels for metrics
function Add-MetricLabel {
    param (
        [string]$Text,
        [int]$Top
    )
    $label = New-Object System.Windows.Forms.Label
    $label.Text = $Text
    $label.Width = 500
    $label.Height = 30
    $label.Top = $Top
    $label.Left = 50
    $label.ForeColor = '#FFCE00'
    $form.Controls.Add($label)
    return $label
}

# Labels for metrics
$fpsLabel = Add-MetricLabel -Text "FPS: Calculating..." -Top 80
$pingLabel = Add-MetricLabel -Text "Ping: Calculating..." -Top 120
$cpuLabel = Add-MetricLabel -Text "CPU Usage: Calculating..." -Top 160
$gpuLabel = Add-MetricLabel -Text "GPU Usage: Not Available" -Top 200
$batteryLabel = Add-MetricLabel -Text "Battery: Calculating..." -Top 240

# FPS calculation (mocked)
Start-Job -ScriptBlock {
    while ($true) {
        Start-Sleep -Milliseconds 1000
        [System.Windows.Forms.Control]::Invoke($fpsLabel, [Action]{ $fpsLabel.Text = "FPS: $((Get-Random -Minimum 30 -Maximum 120))" })
    }
}

# Ping calculation
Start-Job -ScriptBlock {
    while ($true) {
        $start = Get-Date
        try {
            Test-Connection -ComputerName "google.com" -Count 1 -ErrorAction Stop | Out-Null
            $pingTime = (Get-Date) - $start
            [System.Windows.Forms.Control]::Invoke($pingLabel, [Action]{ $pingLabel.Text = "Ping: {0} ms" -f $pingTime.Milliseconds })
        } catch {
            [System.Windows.Forms.Control]::Invoke($pingLabel, [Action]{ $pingLabel.Text = "Ping: Error" })
        }
        Start-Sleep -Seconds 5
    }
}

# CPU Usage
Start-Job -ScriptBlock {
    while ($true) {
        $cpu = (Get-Counter '\\Processor(_Total)\\% Processor Time').CounterSamples.CookedValue
        [System.Windows.Forms.Control]::Invoke($cpuLabel, [Action]{ $cpuLabel.Text = "CPU Usage: {0:N2}%" -f $cpu })
        Start-Sleep -Seconds 2
    }
}

# Battery Status
Start-Job -ScriptBlock {
    while ($true) {
        try {
            $battery = (Get-WmiObject Win32_Battery).EstimatedChargeRemaining
            [System.Windows.Forms.Control]::Invoke($batteryLabel, [Action]{ $batteryLabel.Text = "Battery: {0}%" -f $battery })
        } catch {
            [System.Windows.Forms.Control]::Invoke($batteryLabel, [Action]{ $batteryLabel.Text = "Battery: Not Available" })
        }
        Start-Sleep -Seconds 60
    }
}

# Show form
[System.Windows.Forms.Application]::EnableVisualStyles()
$form.ShowDialog()
