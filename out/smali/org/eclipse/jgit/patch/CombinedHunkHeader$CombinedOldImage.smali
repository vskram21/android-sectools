.class abstract Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;
.super Lorg/eclipse/jgit/patch/HunkHeader$OldImage;
.source "CombinedHunkHeader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/patch/CombinedHunkHeader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "CombinedOldImage"
.end annotation


# instance fields
.field nContext:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;-><init>()V

    return-void
.end method
