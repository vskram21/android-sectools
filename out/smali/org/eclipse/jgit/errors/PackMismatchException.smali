.class public Lorg/eclipse/jgit/errors/PackMismatchException;
.super Ljava/io/IOException;
.source "PackMismatchException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "why"

    .prologue
    .line 59
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 60
    return-void
.end method
