VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Wave Function Picturer"
   ClientHeight    =   7905
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   6870
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   7905
   ScaleWidth      =   6870
   StartUpPosition =   2  'ÆÁÄ»ÖÐÐÄ
   Begin VB.CommandButton Draw 
      Caption         =   "Draw"
      Height          =   615
      Left            =   4920
      TabIndex        =   6
      Top             =   360
      Width           =   1695
   End
   Begin VB.Frame Data 
      Caption         =   "Data"
      Height          =   975
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   3615
      Begin VB.TextBox ta 
         Height          =   375
         Left            =   1920
         TabIndex        =   3
         Text            =   "1"
         Top             =   480
         Width           =   1455
      End
      Begin VB.TextBox tz 
         Height          =   375
         Left            =   240
         TabIndex        =   2
         Text            =   "1"
         Top             =   480
         Width           =   1455
      End
      Begin VB.Label Label2 
         Caption         =   "A0:"
         Height          =   255
         Left            =   1920
         TabIndex        =   5
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label1 
         Caption         =   "Z:"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.PictureBox p 
      Height          =   6615
      Left            =   120
      ScaleHeight     =   6555
      ScaleWidth      =   6555
      TabIndex        =   0
      Top             =   1200
      Width           =   6615
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim Z As Integer
Dim a As Double
Dim a0 As Double
Dim max As Double
Dim pi As Double

Private Function fun(ByVal x As Double, ByVal y As Double)
    Dim t, r, rad As Double
    
    r = Sqr(x * x + y * y)
    rad = Atn(x / y)
    t = r * Z / a0
    
    fun = a * (6 - t) * t * Exp(-t / 3) * Sin(rad)
End Function

Private Sub mark(ByVal x As Double, ByVal y As Double)
    Dim t, i As Double
    
    i = fun(x, y)
    t = 255 - 255 * Abs(i) / max
    
    p.PSet (x, y), RGB(t, t, t)
End Sub

Private Sub Draw_Click()
    pi = 3.1415926
    max = 0
    Z = tz.Text
    a0 = ta.Text
    a = Sqr(2) * (Z / a0) ^ 1.5 / (81 * Sqr(pi))
    
    Dim x, y, gap As Double
    gap = 0.03
    
    For x = -10 To 10 Step gap
        For y = -10 To 10 Step gap
        
            If Abs(fun(x, y)) > max Then
                max = Abs(fun(x, y))
            End If
                
        Next
    Next
    
    p.Scale (-10, 10)-(10, -10)
    
    p.AutoRedraw = False
    
    For x = -10 To 10 Step gap
        For y = -10 To 10 Step gap
            mark x, y
        Next
    Next
    
    p.AutoRedraw = True
    
    'For x = -10 To 10 Step gap
    '    For y = -10 To 10 Step gap
     '       mark x, y
      '  Next
    'Next
End Sub

