.class final Lorg/eclipse/jgit/lib/FileMode$1;
.super Lorg/eclipse/jgit/lib/FileMode;
.source "FileMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/lib/FileMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>(II)V
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/lib/FileMode;-><init>(IILorg/eclipse/jgit/lib/FileMode$1;)V

    return-void
.end method


# virtual methods
.method public equals(I)Z
    .locals 2
    .parameter "modeBits"

    .prologue
    .line 90
    const v0, 0xf000

    and-int/2addr v0, p1

    const/16 v1, 0x4000

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
