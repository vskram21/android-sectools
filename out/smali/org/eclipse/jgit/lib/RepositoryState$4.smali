.class final enum Lorg/eclipse/jgit/lib/RepositoryState$4;
.super Lorg/eclipse/jgit/lib/RepositoryState;
.source "RepositoryState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/RepositoryState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 128
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/lib/RepositoryState;-><init>(Ljava/lang/String;ILorg/eclipse/jgit/lib/RepositoryState$1;)V

    return-void
.end method


# virtual methods
.method public canAmend()Z
    .locals 1

    .prologue
    .line 139
    const/4 v0, 0x0

    return v0
.end method

.method public canCheckout()Z
    .locals 1

    .prologue
    .line 130
    const/4 v0, 0x1

    return v0
.end method

.method public canCommit()Z
    .locals 1

    .prologue
    .line 136
    const/4 v0, 0x1

    return v0
.end method

.method public canResetHead()Z
    .locals 1

    .prologue
    .line 133
    const/4 v0, 0x1

    return v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->repositoryState_merged:Ljava/lang/String;

    return-object v0
.end method

.method public isRebasing()Z
    .locals 1

    .prologue
    .line 142
    const/4 v0, 0x0

    return v0
.end method
