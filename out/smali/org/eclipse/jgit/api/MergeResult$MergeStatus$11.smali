.class final enum Lorg/eclipse/jgit/api/MergeResult$MergeStatus$11;
.super Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
.source "MergeResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/MergeResult$MergeStatus;
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
    .line 198
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/api/MergeResult$MergeStatus;-><init>(Ljava/lang/String;ILorg/eclipse/jgit/api/MergeResult$1;)V

    return-void
.end method


# virtual methods
.method public isSuccessful()Z
    .locals 1

    .prologue
    .line 206
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 201
    const-string v0, "Not-yet-supported"

    return-object v0
.end method
