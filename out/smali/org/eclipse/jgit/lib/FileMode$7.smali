.class final Lorg/eclipse/jgit/lib/FileMode$7;
.super Lorg/eclipse/jgit/lib/FileMode;
.source "FileMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/lib/FileMode;->fromBits(I)Lorg/eclipse/jgit/lib/FileMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$bits:I


# direct methods
.method constructor <init>(III)V
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter

    .prologue
    .line 164
    iput p3, p0, Lorg/eclipse/jgit/lib/FileMode$7;->val$bits:I

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/lib/FileMode;-><init>(IILorg/eclipse/jgit/lib/FileMode$1;)V

    return-void
.end method


# virtual methods
.method public equals(I)Z
    .locals 1
    .parameter "a"

    .prologue
    .line 167
    iget v0, p0, Lorg/eclipse/jgit/lib/FileMode$7;->val$bits:I

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
