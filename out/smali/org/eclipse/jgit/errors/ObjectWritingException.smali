.class public Lorg/eclipse/jgit/errors/ObjectWritingException;
.super Ljava/io/IOException;
.source "ObjectWritingException.java"


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
    .parameter "cause"

    .prologue
    .line 72
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0, p2}, Lorg/eclipse/jgit/errors/ObjectWritingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 74
    return-void
.end method
