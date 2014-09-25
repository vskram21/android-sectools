.class Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;
.super Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;
.source "CombinedHunkHeader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/patch/CombinedHunkHeader;-><init>(Lorg/eclipse/jgit/patch/CombinedFileHeader;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/patch/CombinedHunkHeader;

.field final synthetic val$fh:Lorg/eclipse/jgit/patch/CombinedFileHeader;

.field final synthetic val$imagePos:I


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/patch/CombinedHunkHeader;Lorg/eclipse/jgit/patch/CombinedFileHeader;I)V
    .locals 1
    .parameter
    .parameter
    .parameter

    .prologue
    .line 70
    iput-object p1, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;->this$0:Lorg/eclipse/jgit/patch/CombinedHunkHeader;

    iput-object p2, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;->val$fh:Lorg/eclipse/jgit/patch/CombinedFileHeader;

    iput p3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;->val$imagePos:I

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;-><init>(Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;)V

    return-void
.end method


# virtual methods
.method public getId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 2

    .prologue
    .line 73
    iget-object v0, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;->val$fh:Lorg/eclipse/jgit/patch/CombinedFileHeader;

    iget v1, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;->val$imagePos:I

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->getOldId(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    return-object v0
.end method
