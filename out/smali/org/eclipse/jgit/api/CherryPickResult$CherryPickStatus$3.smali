.class final enum Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus$3;
.super Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;
.source "CherryPickResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;
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
    .line 77
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/api/CherryPickResult$CherryPickStatus;-><init>(Ljava/lang/String;ILorg/eclipse/jgit/api/CherryPickResult$1;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    const-string v0, "Conflicting"

    return-object v0
.end method
