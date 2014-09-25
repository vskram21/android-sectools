.class public Lorg/eclipse/jgit/errors/NoMergeBaseException;
.super Ljava/io/IOException;
.source "NoMergeBaseException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private reason:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;Ljava/lang/String;)V
    .locals 4
    .parameter "reason"
    .parameter "message"

    .prologue
    .line 97
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->noMergeBase:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 99
    iput-object p1, p0, Lorg/eclipse/jgit/errors/NoMergeBaseException;->reason:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    .line 100
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 4
    .parameter "reason"
    .parameter "message"
    .parameter "why"

    .prologue
    .line 114
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v0

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->noMergeBase:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/errors/NoMergeBaseException;->reason:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    .line 117
    invoke-virtual {p0, p3}, Lorg/eclipse/jgit/errors/NoMergeBaseException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 118
    return-void
.end method


# virtual methods
.method public getReason()Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lorg/eclipse/jgit/errors/NoMergeBaseException;->reason:Lorg/eclipse/jgit/errors/NoMergeBaseException$MergeBaseFailureReason;

    return-object v0
.end method
