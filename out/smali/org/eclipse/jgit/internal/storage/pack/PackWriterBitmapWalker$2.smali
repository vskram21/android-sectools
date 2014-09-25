.class final Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$2;
.super Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$BitmapRevFilter;
.source "PackWriterBitmapWalker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker;->newRevFilter(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$bitmapResult:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;)V
    .locals 0
    .parameter

    .prologue
    .line 134
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$2;->val$bitmapResult:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$BitmapRevFilter;-><init>()V

    return-void
.end method


# virtual methods
.method protected load(Lorg/eclipse/jgit/revwalk/RevCommit;)Z
    .locals 2
    .parameter "cmit"

    .prologue
    .line 137
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriterBitmapWalker$2;->val$bitmapResult:Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;

    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lorg/eclipse/jgit/lib/BitmapIndex$BitmapBuilder;->add(Lorg/eclipse/jgit/lib/AnyObjectId;I)Z

    move-result v0

    return v0
.end method
