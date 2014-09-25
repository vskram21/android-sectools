.class public abstract Lorg/eclipse/jgit/lib/RefRename;
.super Ljava/lang/Object;
.source "RefRename.java"


# instance fields
.field protected final destination:Lorg/eclipse/jgit/lib/RefUpdate;

.field private result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

.field protected final source:Lorg/eclipse/jgit/lib/RefUpdate;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/RefUpdate;Lorg/eclipse/jgit/lib/RefUpdate;)V
    .locals 3
    .parameter "src"
    .parameter "dst"

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    iput-object v1, p0, Lorg/eclipse/jgit/lib/RefRename;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 77
    iput-object p1, p0, Lorg/eclipse/jgit/lib/RefRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    .line 78
    iput-object p2, p0, Lorg/eclipse/jgit/lib/RefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    .line 80
    const-string v0, ""

    .line 81
    .local v0, cmd:Ljava/lang/String;
    iget-object v1, p0, Lorg/eclipse/jgit/lib/RefRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "refs/heads/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/eclipse/jgit/lib/RefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "refs/heads/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 83
    const-string v0, "Branch: "

    .line 84
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "renamed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/lib/RefRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/lib/RefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Repository;->shortenRefName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/lib/RefRename;->setRefLogMessage(Ljava/lang/String;)V

    .line 87
    return-void
.end method


# virtual methods
.method public disableRefLog()V
    .locals 3

    .prologue
    .line 135
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    const-string v1, ""

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 136
    return-void
.end method

.method protected abstract doRename()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v0

    return-object v0
.end method

.method public getRefLogMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefLogMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getResult()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefRename;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    return-object v0
.end method

.method protected needToUpdateHEAD()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    iget-object v1, p0, Lorg/eclipse/jgit/lib/RefRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v1

    const-string v2, "HEAD"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefDatabase;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 173
    .local v0, head:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 174
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 175
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/lib/RefRename;->source:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/RefUpdate;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 177
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public rename()Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 151
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefRename;->doRename()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/lib/RefRename;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 152
    iget-object v1, p0, Lorg/eclipse/jgit/lib/RefRename;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 153
    :catch_0
    move-exception v0

    .line 154
    .local v0, err:Ljava/io/IOException;
    sget-object v1, Lorg/eclipse/jgit/lib/RefUpdate$Result;->IO_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    iput-object v1, p0, Lorg/eclipse/jgit/lib/RefRename;->result:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    .line 155
    throw v0
.end method

.method public setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V
    .locals 1
    .parameter "pi"

    .prologue
    .line 107
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 108
    return-void
.end method

.method public setRefLogMessage(Ljava/lang/String;)V
    .locals 2
    .parameter "msg"

    .prologue
    .line 127
    if-nez p1, :cond_0

    .line 128
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/RefRename;->disableRefLog()V

    .line 131
    :goto_0
    return-void

    .line 130
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/lib/RefRename;->destination:Lorg/eclipse/jgit/lib/RefUpdate;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    goto :goto_0
.end method
