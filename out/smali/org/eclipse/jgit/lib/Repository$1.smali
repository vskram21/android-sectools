.class Lorg/eclipse/jgit/lib/Repository$1;
.super Ljava/lang/Object;
.source "Repository.java"

# interfaces
.implements Lorg/eclipse/jgit/events/IndexChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/lib/Repository;->lockDirCache()Lorg/eclipse/jgit/dircache/DirCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter

    .prologue
    .line 1047
    iput-object p1, p0, Lorg/eclipse/jgit/lib/Repository$1;->this$0:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onIndexChanged(Lorg/eclipse/jgit/events/IndexChangedEvent;)V
    .locals 1
    .parameter "event"

    .prologue
    .line 1050
    iget-object v0, p0, Lorg/eclipse/jgit/lib/Repository$1;->this$0:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->notifyIndexChanged()V

    .line 1051
    return-void
.end method
