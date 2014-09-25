.class final Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;
.super Lorg/eclipse/jgit/lib/RefRename;
.source "DfsRefRename.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename$1;
    }
.end annotation


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)V
    .locals 0
    .parameter "src"
    .parameter "dst"

    .prologue
    .line 55
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/lib/RefRename;-><init>(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)V

    .line 56
    return-void
.end method


# virtual methods
.method protected doRename()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 64
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v1

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 65
    sget-object v0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->update()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 71
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate;->getResult()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v0

    :goto_0
    return-object v0

    .line 67
    :pswitch_0
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/dfs/DfsRefRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate;->delete()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 68
    sget-object v0, Lorg/eclipse/jgit/lib/RefUpdate$Result;->RENAMED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    goto :goto_0

    .line 65
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
