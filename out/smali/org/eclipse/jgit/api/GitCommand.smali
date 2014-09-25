.class public abstract Lorg/eclipse/jgit/api/GitCommand;
.super Ljava/lang/Object;
.source "GitCommand.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private callable:Z

.field protected final repo:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 82
    .local p0, this:Lorg/eclipse/jgit/api/GitCommand;,"Lorg/eclipse/jgit/api/GitCommand<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/GitCommand;->callable:Z

    .line 83
    iput-object p1, p0, Lorg/eclipse/jgit/api/GitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    .line 84
    return-void
.end method


# virtual methods
.method public abstract call()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation
.end method

.method protected checkCallable()V
    .locals 5

    .prologue
    .line 115
    .local p0, this:Lorg/eclipse/jgit/api/GitCommand;,"Lorg/eclipse/jgit/api/GitCommand<TT;>;"
    iget-boolean v0, p0, Lorg/eclipse/jgit/api/GitCommand;->callable:Z

    if-nez v0, :cond_0

    .line 116
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->commandWasCalledInTheWrongState:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 119
    :cond_0
    return-void
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 90
    .local p0, this:Lorg/eclipse/jgit/api/GitCommand;,"Lorg/eclipse/jgit/api/GitCommand<TT;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/api/GitCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method protected setCallable(Z)V
    .locals 0
    .parameter "callable"

    .prologue
    .line 103
    .local p0, this:Lorg/eclipse/jgit/api/GitCommand;,"Lorg/eclipse/jgit/api/GitCommand<TT;>;"
    iput-boolean p1, p0, Lorg/eclipse/jgit/api/GitCommand;->callable:Z

    .line 104
    return-void
.end method
