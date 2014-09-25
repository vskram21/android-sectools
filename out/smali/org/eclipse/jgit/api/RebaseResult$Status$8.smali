.class final enum Lorg/eclipse/jgit/api/RebaseResult$Status$8;
.super Lorg/eclipse/jgit/api/RebaseResult$Status;
.source "RebaseResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/RebaseResult$Status;
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
    .line 131
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/api/RebaseResult$Status;-><init>(Ljava/lang/String;ILorg/eclipse/jgit/api/RebaseResult$1;)V

    return-void
.end method


# virtual methods
.method public isSuccessful()Z
    .locals 1

    .prologue
    .line 134
    const/4 v0, 0x1

    return v0
.end method
