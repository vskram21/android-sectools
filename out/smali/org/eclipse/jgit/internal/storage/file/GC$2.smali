.class final Lorg/eclipse/jgit/internal/storage/file/GC$2;
.super Ljava/lang/Object;
.source "GC.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/file/GC;->objectIdSet(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)Lorg/eclipse/jgit/internal/storage/pack/PackWriter$ObjectIdSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/PackIndex;)V
    .locals 0
    .parameter

    .prologue
    .line 968
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/GC$2;->val$idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 1
    .parameter "objectId"

    .prologue
    .line 970
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/GC$2;->val$idx:Lorg/eclipse/jgit/internal/storage/file/PackIndex;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    return v0
.end method
