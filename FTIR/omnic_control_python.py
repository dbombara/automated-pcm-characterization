# Python Code
import win32com.client #loads COM library
OmApp = win32com.client.Dispatch("OmnicApp.OmnicApp")  #connects to Omnic
OmApp.ExecuteCommand("NewWindow")   #opens a new window in Omnic
OmApp.Set('Collect NumScans',5)  #sets number of scans to 5