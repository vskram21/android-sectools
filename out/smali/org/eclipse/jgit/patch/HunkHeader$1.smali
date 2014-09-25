.class Lorg/eclipse/jgit/patch/HunkHeader$1;
.super Lorg/eclipse/jgit/patch/HunkHeader$OldImage;
.source "HunkHeader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/patch/HunkHeader;-><init>(Lorg/eclipse/jgit/patch/FileHeader;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$fh:Lorg/eclipse/jgit/patch/FileHeader;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/patch/FileHeader;)V
    .locals 0
    .parameter

    .prologue
    .line 122
    iput-object p1, p0, Lorg/eclipse/jgit/patch/HunkHeader$1;->val$fh:Lorg/eclipse/jgit/patch/FileHeader;

    invoke-direct {p0}, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;-><init>()V

    return-void
.end method


# virtual methods
.method public getId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/eclipse/jgit/patch/HunkHeader$1;->val$fh:Lorg/eclipse/jgit/patch/FileHeader;

    invoke-virtual {v0}, Lorg/eclipse/jgit/patch/FileHeader;->getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    return-object v0
.end method
