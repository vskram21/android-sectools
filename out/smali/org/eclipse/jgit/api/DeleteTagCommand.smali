.class public Lorg/eclipse/jgit/api/DeleteTagCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "DeleteTagCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/DeleteTagCommand$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/util/List",
        "<",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final tags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repo"

    .prologue
    .line 77
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 71
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/DeleteTagCommand;->tags:Ljava/util/Set;

    .line 78
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/DeleteTagCommand;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/DeleteTagCommand;->checkCallable()V

    .line 85
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .local v6, result:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    iget-object v9, p0, Lorg/eclipse/jgit/api/DeleteTagCommand;->tags:Ljava/util/Set;

    invoke-interface {v9}, Ljava/util/Set;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_1

    .line 119
    :cond_0
    return-object v6

    .line 89
    :cond_1
    const/4 v9, 0x0

    :try_start_0
    invoke-virtual {p0, v9}, Lorg/eclipse/jgit/api/DeleteTagCommand;->setCallable(Z)V

    .line 90
    iget-object v9, p0, Lorg/eclipse/jgit/api/DeleteTagCommand;->tags:Ljava/util/Set;

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 91
    .local v7, tagName:Ljava/lang/String;
    if-eqz v7, :cond_2

    .line 93
    iget-object v9, p0, Lorg/eclipse/jgit/api/DeleteTagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v9, v7}, Lorg/eclipse/jgit/lib/Repository;->getRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 94
    .local v0, currentRef:Lorg/eclipse/jgit/lib/Ref;
    if-eqz v0, :cond_2

    .line 96
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, fullName:Ljava/lang/String;
    iget-object v9, p0, Lorg/eclipse/jgit/api/DeleteTagCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v9, v2}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v8

    .line 98
    .local v8, update:Lorg/eclipse/jgit/lib/RefUpdate;
    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 99
    invoke-virtual {v8}, Lorg/eclipse/jgit/lib/RefUpdate;->delete()Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v1

    .line 101
    .local v1, deleteResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    const/4 v5, 0x1

    .line 102
    .local v5, ok:Z
    sget-object v9, Lorg/eclipse/jgit/api/DeleteTagCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v10

    aget v9, v9, v10

    packed-switch v9, :pswitch_data_0

    .line 112
    :goto_1
    if-eqz v5, :cond_3

    .line 113
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 120
    .end local v0           #currentRef:Lorg/eclipse/jgit/lib/Ref;
    .end local v1           #deleteResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .end local v2           #fullName:Ljava/lang/String;
    .end local v3           #i$:Ljava/util/Iterator;
    .end local v5           #ok:Z
    .end local v7           #tagName:Ljava/lang/String;
    .end local v8           #update:Lorg/eclipse/jgit/lib/RefUpdate;
    :catch_0
    move-exception v4

    .line 121
    .local v4, ioe:Ljava/io/IOException;
    new-instance v9, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v4}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 106
    .end local v4           #ioe:Ljava/io/IOException;
    .restart local v0       #currentRef:Lorg/eclipse/jgit/lib/Ref;
    .restart local v1       #deleteResult:Lorg/eclipse/jgit/lib/RefUpdate$Result;
    .restart local v2       #fullName:Ljava/lang/String;
    .restart local v3       #i$:Ljava/util/Iterator;
    .restart local v5       #ok:Z
    .restart local v7       #tagName:Ljava/lang/String;
    .restart local v8       #update:Lorg/eclipse/jgit/lib/RefUpdate;
    :pswitch_0
    const/4 v5, 0x0

    .line 107
    goto :goto_1

    .line 115
    :cond_3
    :try_start_1
    new-instance v9, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->deleteTagUnexpectedResult:Ljava/lang/String;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->name()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 102
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public varargs setTags([Ljava/lang/String;)Lorg/eclipse/jgit/api/DeleteTagCommand;
    .locals 5
    .parameter "tags"

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/DeleteTagCommand;->checkCallable()V

    .line 133
    iget-object v4, p0, Lorg/eclipse/jgit/api/DeleteTagCommand;->tags:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->clear()V

    .line 134
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/String;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 135
    .local v3, tagName:Ljava/lang/String;
    iget-object v4, p0, Lorg/eclipse/jgit/api/DeleteTagCommand;->tags:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 134
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 136
    .end local v3           #tagName:Ljava/lang/String;
    :cond_0
    return-object p0
.end method
