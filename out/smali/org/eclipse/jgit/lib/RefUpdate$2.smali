.class Lorg/eclipse/jgit/lib/RefUpdate$2;
.super Lorg/eclipse/jgit/lib/RefUpdate$Store;
.source "RefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/lib/RefUpdate;->delete(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/lib/RefUpdate;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/RefUpdate;)V
    .locals 1
    .parameter

    .prologue
    .line 542
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RefUpdate$2;->this$0:Lorg/eclipse/jgit/lib/RefUpdate;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/lib/RefUpdate$Store;-><init>(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate$1;)V

    return-void
.end method


# virtual methods
.method execute(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 1
    .parameter "status"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 545
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefUpdate$2;->this$0:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->doDelete(Lorg/eclipse/jgit/lib/RefUpdate$Result;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v0

    return-object v0
.end method
