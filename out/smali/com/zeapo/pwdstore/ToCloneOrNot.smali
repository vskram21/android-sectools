.class public Lcom/zeapo/pwdstore/ToCloneOrNot;
.super Landroid/app/Fragment;
.source "ToCloneOrNot.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;
    }
.end annotation


# static fields
.field private static final ARG_PARAM1:Ljava/lang/String; = "param1"

.field private static final ARG_PARAM2:Ljava/lang/String; = "param2"


# instance fields
.field private mListener:Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;

.field private mParam1:Ljava/lang/String;

.field private mParam2:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    .line 53
    return-void
.end method

.method public static newInstance(Ljava/lang/String;Ljava/lang/String;)Lcom/zeapo/pwdstore/ToCloneOrNot;
    .locals 3
    .parameter "param1"
    .parameter "param2"

    .prologue
    .line 44
    new-instance v1, Lcom/zeapo/pwdstore/ToCloneOrNot;

    invoke-direct {v1}, Lcom/zeapo/pwdstore/ToCloneOrNot;-><init>()V

    .line 45
    .local v1, fragment:Lcom/zeapo/pwdstore/ToCloneOrNot;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 46
    .local v0, args:Landroid/os/Bundle;
    const-string v2, "param1"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    const-string v2, "param2"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    invoke-virtual {v1, v0}, Lcom/zeapo/pwdstore/ToCloneOrNot;->setArguments(Landroid/os/Bundle;)V

    .line 49
    return-object v1
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 5
    .parameter "activity"

    .prologue
    .line 80
    invoke-super {p0, p1}, Landroid/app/Fragment;->onAttach(Landroid/app/Activity;)V

    .line 82
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;

    move-object v2, v0

    iput-object v2, p0, Lcom/zeapo/pwdstore/ToCloneOrNot;->mListener:Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    return-void

    .line 83
    :catch_0
    move-exception v1

    .line 84
    .local v1, e:Ljava/lang/ClassCastException;
    new-instance v2, Ljava/lang/ClassCastException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " must implement OnFragmentInteractionListener"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ClassCastException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public onButtonPressed(Landroid/net/Uri;)V
    .locals 1
    .parameter "uri"

    .prologue
    .line 73
    iget-object v0, p0, Lcom/zeapo/pwdstore/ToCloneOrNot;->mListener:Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/zeapo/pwdstore/ToCloneOrNot;->mListener:Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;

    invoke-interface {v0, p1}, Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;->onFragmentInteraction(Landroid/net/Uri;)V

    .line 76
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    .line 57
    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 58
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/ToCloneOrNot;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 59
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/ToCloneOrNot;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "param1"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zeapo/pwdstore/ToCloneOrNot;->mParam1:Ljava/lang/String;

    .line 60
    invoke-virtual {p0}, Lcom/zeapo/pwdstore/ToCloneOrNot;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "param2"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/zeapo/pwdstore/ToCloneOrNot;->mParam2:Ljava/lang/String;

    .line 62
    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .parameter "inflater"
    .parameter "container"
    .parameter "savedInstanceState"

    .prologue
    .line 68
    const v0, 0x7f03001f

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDetach()V
    .locals 1

    .prologue
    .line 91
    invoke-super {p0}, Landroid/app/Fragment;->onDetach()V

    .line 92
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/zeapo/pwdstore/ToCloneOrNot;->mListener:Lcom/zeapo/pwdstore/ToCloneOrNot$OnFragmentInteractionListener;

    .line 93
    return-void
.end method
