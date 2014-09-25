.class Lorg/eclipse/jgit/transport/FetchHeadRecord;
.super Ljava/lang/Object;
.source "FetchHeadRecord.java"


# instance fields
.field newValue:Lorg/eclipse/jgit/lib/ObjectId;

.field notForMerge:Z

.field sourceName:Ljava/lang/String;

.field sourceURI:Lorg/eclipse/jgit/transport/URIish;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method write(Ljava/io/Writer;)V
    .locals 5
    .parameter "pw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x9

    .line 69
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceName:Ljava/lang/String;

    const-string v3, "refs/heads/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 70
    const-string v1, "branch"

    .line 71
    .local v1, type:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceName:Ljava/lang/String;

    const-string v3, "refs/heads/"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, name:Ljava/lang/String;
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->newValue:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 84
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 85
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->notForMerge:Z

    if-eqz v2, :cond_0

    .line 86
    const-string v2, "not-for-merge"

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 87
    :cond_0
    invoke-virtual {p1, v4}, Ljava/io/Writer;->write(I)V

    .line 88
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 89
    const-string v2, " \'"

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 90
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 91
    const-string v2, "\' of "

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 92
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceURI:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/URIish;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 93
    const-string v2, "\n"

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 94
    return-void

    .line 72
    .end local v0           #name:Ljava/lang/String;
    .end local v1           #type:Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceName:Ljava/lang/String;

    const-string v3, "refs/tags/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 73
    const-string v1, "tag"

    .line 74
    .restart local v1       #type:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceName:Ljava/lang/String;

    const-string v3, "refs/tags/"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #name:Ljava/lang/String;
    goto :goto_0

    .line 75
    .end local v0           #name:Ljava/lang/String;
    .end local v1           #type:Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceName:Ljava/lang/String;

    const-string v3, "refs/remotes/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 76
    const-string v1, "remote branch"

    .line 77
    .restart local v1       #type:Ljava/lang/String;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceName:Ljava/lang/String;

    const-string v3, "refs/remotes/"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #name:Ljava/lang/String;
    goto :goto_0

    .line 79
    .end local v0           #name:Ljava/lang/String;
    .end local v1           #type:Ljava/lang/String;
    :cond_3
    const-string v1, ""

    .line 80
    .restart local v1       #type:Ljava/lang/String;
    iget-object v0, p0, Lorg/eclipse/jgit/transport/FetchHeadRecord;->sourceName:Ljava/lang/String;

    .restart local v0       #name:Ljava/lang/String;
    goto :goto_0
.end method
