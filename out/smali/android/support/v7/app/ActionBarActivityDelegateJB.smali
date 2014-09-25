.class Landroid/support/v7/app/ActionBarActivityDelegateJB;
.super Landroid/support/v7/app/ActionBarActivityDelegateICS;
.source "ActionBarActivityDelegateJB.java"


# direct methods
.method constructor <init>(Landroid/support/v7/app/ActionBarActivity;)V
    .locals 0
    .parameter "activity"

    .prologue
    .line 22
    invoke-direct {p0, p1}, Landroid/support/v7/app/ActionBarActivityDelegateICS;-><init>(Landroid/support/v7/app/ActionBarActivity;)V

    .line 23
    return-void
.end method


# virtual methods
.method public createSupportActionBar()Landroid/support/v7/app/ActionBar;
    .locals 3

    .prologue
    .line 27
    new-instance v0, Landroid/support/v7/app/ActionBarImplJB;

    iget-object v1, p0, Landroid/support/v7/app/ActionBarActivityDelegateJB;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    iget-object v2, p0, Landroid/support/v7/app/ActionBarActivityDelegateJB;->mActivity:Landroid/support/v7/app/ActionBarActivity;

    invoke-direct {v0, v1, v2}, Landroid/support/v7/app/ActionBarImplJB;-><init>(Landroid/app/Activity;Landroid/support/v7/app/ActionBar$Callback;)V

    return-object v0
.end method
