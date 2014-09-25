.class public Lorg/eclipse/jgit/transport/UploadPackInternalServerErrorException;
.super Ljava/io/IOException;
.source "UploadPackInternalServerErrorException.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0
    .parameter "why"

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    .line 59
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/transport/UploadPackInternalServerErrorException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 60
    return-void
.end method
