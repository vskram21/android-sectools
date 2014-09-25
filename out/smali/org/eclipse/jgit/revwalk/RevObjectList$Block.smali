.class public Lorg/eclipse/jgit/revwalk/RevObjectList$Block;
.super Ljava/lang/Object;
.source "RevObjectList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/RevObjectList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Block"
.end annotation


# instance fields
.field final contents:[Ljava/lang/Object;

.field final shift:I


# direct methods
.method constructor <init>(I)V
    .locals 1
    .parameter "s"

    .prologue
    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    const/16 v0, 0x100

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->contents:[Ljava/lang/Object;

    .line 138
    iput p1, p0, Lorg/eclipse/jgit/revwalk/RevObjectList$Block;->shift:I

    .line 139
    return-void
.end method
