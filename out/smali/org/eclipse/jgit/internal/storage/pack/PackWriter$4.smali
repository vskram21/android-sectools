.class Lorg/eclipse/jgit/internal/storage/pack/PackWriter$4;
.super Ljava/lang/Object;
.source "PackWriter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->parallelDeltaSearch(Lorg/eclipse/jgit/lib/ProgressMonitor;[Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

.field final synthetic val$errors:Ljava/util/List;

.field final synthetic val$task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/pack/PackWriter;Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;Ljava/util/List;)V
    .locals 0
    .parameter
    .parameter
    .parameter

    .prologue
    .line 1399
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$4;->this$0:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$4;->val$task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;

    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$4;->val$errors:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 1402
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$4;->val$task:Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/pack/DeltaTask;->call()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 1406
    :goto_0
    return-void

    .line 1403
    :catch_0
    move-exception v0

    .line 1404
    .local v0, failure:Ljava/lang/Throwable;
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackWriter$4;->val$errors:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method
