.class public Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;
.super Lorg/eclipse/jgit/api/errors/GitAPIException;
.source "ConcurrentRefUpdateException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field private ref:Lorg/eclipse/jgit/lib/Ref;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    .locals 4
    .parameter "message"
    .parameter "ref"
    .parameter "rc"

    .prologue
    .line 78
    if-nez p3, :cond_0

    .end local p1
    :goto_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;)V

    .line 80
    iput-object p3, p0, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;->rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 81
    iput-object p2, p0, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;->ref:Lorg/eclipse/jgit/lib/Ref;

    .line 82
    return-void

    .line 78
    .restart local p1
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ". "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->refUpdateReturnCodeWas:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;Lorg/eclipse/jgit/lib/RefUpdate$Result;Ljava/lang/Throwable;)V
    .locals 4
    .parameter "message"
    .parameter "ref"
    .parameter "rc"
    .parameter "cause"

    .prologue
    .line 65
    if-nez p3, :cond_0

    .end local p1
    :goto_0
    invoke-direct {p0, p1, p4}, Lorg/eclipse/jgit/api/errors/GitAPIException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 67
    iput-object p3, p0, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;->rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 68
    iput-object p2, p0, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;->ref:Lorg/eclipse/jgit/lib/Ref;

    .line 69
    return-void

    .line 65
    .restart local p1
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ". "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->refUpdateReturnCodeWas:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p3, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method


# virtual methods
.method public getRef()Lorg/eclipse/jgit/lib/Ref;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;->ref:Lorg/eclipse/jgit/lib/Ref;

    return-object v0
.end method

.method public getResult()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/eclipse/jgit/api/errors/ConcurrentRefUpdateException;->rc:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    return-object v0
.end method
