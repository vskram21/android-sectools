.class public Lorg/eclipse/jgit/transport/UploadPackMayNotContinueException;
.super Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
.source "UploadPackMayNotContinueException.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;-><init>()V

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .parameter "msg"

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;-><init>(Ljava/lang/String;)V

    .line 67
    return-void
.end method
