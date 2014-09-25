.class public Lorg/eclipse/jgit/errors/NotSupportedException;
.super Ljava/io/IOException;
.source "NotSupportedException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "s"

    .prologue
    .line 62
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .parameter "s"
    .parameter "why"

    .prologue
    .line 74
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 75
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/errors/NotSupportedException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 76
    return-void
.end method
