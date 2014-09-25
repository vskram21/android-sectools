.class public Lorg/eclipse/jgit/transport/RemoteConfig;
.super Ljava/lang/Object;
.source "RemoteConfig.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final DEFAULT_MIRROR:Z = false

.field public static final DEFAULT_RECEIVE_PACK:Ljava/lang/String; = "git-receive-pack"

.field public static final DEFAULT_UPLOAD_PACK:Ljava/lang/String; = "git-upload-pack"

.field private static final KEY_FETCH:Ljava/lang/String; = "fetch"

.field private static final KEY_INSTEADOF:Ljava/lang/String; = "insteadof"

.field private static final KEY_MIRROR:Ljava/lang/String; = "mirror"

.field private static final KEY_PUSH:Ljava/lang/String; = "push"

.field private static final KEY_PUSHINSTEADOF:Ljava/lang/String; = "pushinsteadof"

.field private static final KEY_PUSHURL:Ljava/lang/String; = "pushurl"

.field private static final KEY_RECEIVEPACK:Ljava/lang/String; = "receivepack"

.field private static final KEY_TAGOPT:Ljava/lang/String; = "tagopt"

.field private static final KEY_TIMEOUT:Ljava/lang/String; = "timeout"

.field private static final KEY_UPLOADPACK:Ljava/lang/String; = "uploadpack"

.field private static final KEY_URL:Ljava/lang/String; = "url"

.field private static final SECTION:Ljava/lang/String; = "remote"

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private fetch:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation
.end field

.field private mirror:Z

.field private name:Ljava/lang/String;

.field private push:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation
.end field

.field private pushURIs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/URIish;",
            ">;"
        }
    .end annotation
.end field

.field private receivepack:Ljava/lang/String;

.field private tagopt:Lorg/eclipse/jgit/transport/TagOpt;

.field private timeout:I

.field private uploadpack:Ljava/lang/String;

.field private uris:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/URIish;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V
    .locals 12
    .parameter "rc"
    .parameter "remoteName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 164
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    iput-object p2, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    .line 170
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "url"

    invoke-virtual {p1, v8, v9, v10}, Lorg/eclipse/jgit/lib/Config;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 171
    .local v7, vlst:[Ljava/lang/String;
    const-string v8, "insteadof"

    invoke-direct {p0, p1, v8}, Lorg/eclipse/jgit/transport/RemoteConfig;->getReplacements(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v2

    .line 172
    .local v2, insteadOf:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v8, Ljava/util/ArrayList;

    array-length v9, v7

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->uris:Ljava/util/List;

    .line 173
    move-object v0, v7

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v5, v0, v1

    .line 174
    .local v5, s:Ljava/lang/String;
    iget-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->uris:Ljava/util/List;

    new-instance v9, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {p0, v5, v2}, Lorg/eclipse/jgit/transport/RemoteConfig;->replaceUri(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/transport/URIish;-><init>(Ljava/lang/String;)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 173
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 176
    .end local v5           #s:Ljava/lang/String;
    :cond_0
    const-string v8, "pushinsteadof"

    invoke-direct {p0, p1, v8}, Lorg/eclipse/jgit/transport/RemoteConfig;->getReplacements(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    .line 178
    .local v4, pushInsteadOf:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "pushurl"

    invoke-virtual {p1, v8, v9, v10}, Lorg/eclipse/jgit/lib/Config;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 179
    new-instance v8, Ljava/util/ArrayList;

    array-length v9, v7

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->pushURIs:Ljava/util/List;

    .line 180
    move-object v0, v7

    array-length v3, v0

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v3, :cond_1

    aget-object v5, v0, v1

    .line 181
    .restart local v5       #s:Ljava/lang/String;
    iget-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->pushURIs:Ljava/util/List;

    new-instance v9, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {p0, v5, v4}, Lorg/eclipse/jgit/transport/RemoteConfig;->replaceUri(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/eclipse/jgit/transport/URIish;-><init>(Ljava/lang/String;)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 183
    .end local v5           #s:Ljava/lang/String;
    :cond_1
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "fetch"

    invoke-virtual {p1, v8, v9, v10}, Lorg/eclipse/jgit/lib/Config;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 184
    new-instance v8, Ljava/util/ArrayList;

    array-length v9, v7

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->fetch:Ljava/util/List;

    .line 185
    move-object v0, v7

    array-length v3, v0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v3, :cond_2

    aget-object v5, v0, v1

    .line 186
    .restart local v5       #s:Ljava/lang/String;
    iget-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->fetch:Ljava/util/List;

    new-instance v9, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v9, v5}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 185
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 188
    .end local v5           #s:Ljava/lang/String;
    :cond_2
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "push"

    invoke-virtual {p1, v8, v9, v10}, Lorg/eclipse/jgit/lib/Config;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 189
    new-instance v8, Ljava/util/ArrayList;

    array-length v9, v7

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->push:Ljava/util/List;

    .line 190
    move-object v0, v7

    array-length v3, v0

    const/4 v1, 0x0

    :goto_3
    if-ge v1, v3, :cond_3

    aget-object v5, v0, v1

    .line 191
    .restart local v5       #s:Ljava/lang/String;
    iget-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->push:Ljava/util/List;

    new-instance v9, Lorg/eclipse/jgit/transport/RefSpec;

    invoke-direct {v9, v5}, Lorg/eclipse/jgit/transport/RefSpec;-><init>(Ljava/lang/String;)V

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 193
    .end local v5           #s:Ljava/lang/String;
    :cond_3
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "uploadpack"

    invoke-virtual {p1, v8, v9, v10}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 194
    .local v6, val:Ljava/lang/String;
    if-nez v6, :cond_4

    .line 195
    const-string v6, "git-upload-pack"

    .line 196
    :cond_4
    iput-object v6, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->uploadpack:Ljava/lang/String;

    .line 198
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "receivepack"

    invoke-virtual {p1, v8, v9, v10}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 199
    if-nez v6, :cond_5

    .line 200
    const-string v6, "git-receive-pack"

    .line 201
    :cond_5
    iput-object v6, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->receivepack:Ljava/lang/String;

    .line 203
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "tagopt"

    invoke-virtual {p1, v8, v9, v10}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 204
    invoke-static {v6}, Lorg/eclipse/jgit/transport/TagOpt;->fromOption(Ljava/lang/String;)Lorg/eclipse/jgit/transport/TagOpt;

    move-result-object v8

    iput-object v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->tagopt:Lorg/eclipse/jgit/transport/TagOpt;

    .line 205
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "mirror"

    invoke-virtual {p1, v8, v9, v10, v11}, Lorg/eclipse/jgit/lib/Config;->getBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    iput-boolean v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->mirror:Z

    .line 206
    const-string v8, "remote"

    iget-object v9, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    const-string v10, "timeout"

    invoke-virtual {p1, v8, v9, v10, v11}, Lorg/eclipse/jgit/lib/Config;->getInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    move-result v8

    iput v8, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->timeout:I

    .line 207
    return-void
.end method

.method public static getAllRemoteConfigs(Lorg/eclipse/jgit/lib/Config;)Ljava/util/List;
    .locals 5
    .parameter "rc"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Config;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RemoteConfig;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 117
    new-instance v2, Ljava/util/ArrayList;

    const-string v4, "remote"

    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/lib/Config;->getSubsections(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 119
    .local v2, names:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 121
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 123
    .local v3, result:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RemoteConfig;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 124
    .local v1, name:Ljava/lang/String;
    new-instance v4, Lorg/eclipse/jgit/transport/RemoteConfig;

    invoke-direct {v4, p0, v1}, Lorg/eclipse/jgit/transport/RemoteConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 125
    .end local v1           #name:Ljava/lang/String;
    :cond_0
    return-object v3
.end method

.method private getReplacements(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/util/Map;
    .locals 8
    .parameter "config"
    .parameter "keyName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/Config;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 275
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 276
    .local v5, replacements:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "url"

    invoke-virtual {p1, v7}, Lorg/eclipse/jgit/lib/Config;->getSubsections(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 277
    .local v6, url:Ljava/lang/String;
    const-string v7, "url"

    invoke-virtual {p1, v7, v6, p2}, Lorg/eclipse/jgit/lib/Config;->getStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, arr$:[Ljava/lang/String;
    array-length v4, v0

    .local v4, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v3, v0, v2

    .line 278
    .local v3, insteadOf:Ljava/lang/String;
    invoke-interface {v5, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 279
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #insteadOf:Ljava/lang/String;
    .end local v4           #len$:I
    .end local v6           #url:Ljava/lang/String;
    :cond_1
    return-object v5
.end method

.method private replaceUri(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;
    .locals 5
    .parameter "uri"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 284
    .local p2, replacements:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 299
    .end local p1
    :cond_0
    :goto_0
    return-object p1

    .line 286
    .restart local p1
    :cond_1
    const/4 v1, 0x0

    .line 287
    .local v1, match:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 289
    .local v2, replacement:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-gt v4, v3, :cond_2

    .line 292
    :cond_3
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 294
    move-object v1, v2

    .line 295
    goto :goto_1

    .line 296
    .end local v2           #replacement:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    if-eqz v1, :cond_0

    .line 297
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private set(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;II)V
    .locals 2
    .parameter "rc"
    .parameter "key"
    .parameter "currentValue"
    .parameter "defaultValue"

    .prologue
    .line 263
    if-ne p4, p3, :cond_0

    .line 264
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/RemoteConfig;->unset(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 267
    :goto_0
    return-void

    .line 266
    :cond_0
    const-string v0, "remote"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->setInt(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private set(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "rc"
    .parameter "key"
    .parameter "currentValue"
    .parameter "defaultValue"

    .prologue
    .line 247
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 248
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/RemoteConfig;->unset(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 251
    :goto_0
    return-void

    .line 250
    :cond_0
    const-string v0, "remote"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->setString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private set(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;ZZ)V
    .locals 2
    .parameter "rc"
    .parameter "key"
    .parameter "currentValue"
    .parameter "defaultValue"

    .prologue
    .line 255
    if-ne p4, p3, :cond_0

    .line 256
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/transport/RemoteConfig;->unset(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V

    .line 259
    :goto_0
    return-void

    .line 258
    :cond_0
    const-string v0, "remote"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1, p2, p3}, Lorg/eclipse/jgit/lib/Config;->setBoolean(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private unset(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)V
    .locals 2
    .parameter "rc"
    .parameter "key"

    .prologue
    .line 270
    const-string v0, "remote"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1, p2}, Lorg/eclipse/jgit/lib/Config;->unset(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 271
    return-void
.end method


# virtual methods
.method public addFetchRefSpec(Lorg/eclipse/jgit/transport/RefSpec;)Z
    .locals 1
    .parameter "s"

    .prologue
    .line 394
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->fetch:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 395
    const/4 v0, 0x0

    .line 396
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->fetch:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public addPushRefSpec(Lorg/eclipse/jgit/transport/RefSpec;)Z
    .locals 1
    .parameter "s"

    .prologue
    .line 451
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->push:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 452
    const/4 v0, 0x0

    .line 453
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->push:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public addPushURI(Lorg/eclipse/jgit/transport/URIish;)Z
    .locals 1
    .parameter "toAdd"

    .prologue
    .line 361
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->pushURIs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    const/4 v0, 0x0

    .line 363
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->pushURIs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public addURI(Lorg/eclipse/jgit/transport/URIish;)Z
    .locals 1
    .parameter "toAdd"

    .prologue
    .line 328
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->uris:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    const/4 v0, 0x0

    .line 330
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->uris:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public getFetchRefSpecs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation

    .prologue
    .line 383
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->fetch:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 308
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPushRefSpecs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;"
        }
    .end annotation

    .prologue
    .line 440
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->push:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getPushURIs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/URIish;",
            ">;"
        }
    .end annotation

    .prologue
    .line 350
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->pushURIs:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getReceivePack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 494
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->receivepack:Ljava/lang/String;

    return-object v0
.end method

.method public getTagOpt()Lorg/eclipse/jgit/transport/TagOpt;
    .locals 1

    .prologue
    .line 503
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->tagopt:Lorg/eclipse/jgit/transport/TagOpt;

    return-object v0
.end method

.method public getTimeout()I
    .locals 1

    .prologue
    .line 536
    iget v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->timeout:I

    return v0
.end method

.method public getURIs()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/URIish;",
            ">;"
        }
    .end annotation

    .prologue
    .line 317
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->uris:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getUploadPack()Ljava/lang/String;
    .locals 1

    .prologue
    .line 479
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->uploadpack:Ljava/lang/String;

    return-object v0
.end method

.method public isMirror()Z
    .locals 1

    .prologue
    .line 521
    iget-boolean v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->mirror:Z

    return v0
.end method

.method public removeFetchRefSpec(Lorg/eclipse/jgit/transport/RefSpec;)Z
    .locals 1
    .parameter "s"

    .prologue
    .line 431
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->fetch:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removePushRefSpec(Lorg/eclipse/jgit/transport/RefSpec;)Z
    .locals 1
    .parameter "s"

    .prologue
    .line 464
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->push:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removePushURI(Lorg/eclipse/jgit/transport/URIish;)Z
    .locals 1
    .parameter "toRemove"

    .prologue
    .line 374
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->pushURIs:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeURI(Lorg/eclipse/jgit/transport/URIish;)Z
    .locals 1
    .parameter "toRemove"

    .prologue
    .line 341
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->uris:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setFetchRefSpecs(Ljava/util/List;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 407
    .local p1, specs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->fetch:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 408
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->fetch:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 409
    return-void
.end method

.method public setMirror(Z)V
    .locals 0
    .parameter "m"

    .prologue
    .line 531
    iput-boolean p1, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->mirror:Z

    .line 532
    return-void
.end method

.method public setPushRefSpecs(Ljava/util/List;)V
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/RefSpec;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 419
    .local p1, specs:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/RefSpec;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->push:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 420
    iget-object v0, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->push:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 421
    return-void
.end method

.method public setTagOpt(Lorg/eclipse/jgit/transport/TagOpt;)V
    .locals 0
    .parameter "option"

    .prologue
    .line 513
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->tagopt:Lorg/eclipse/jgit/transport/TagOpt;

    .line 514
    return-void

    .line 513
    .restart local p1
    :cond_0
    sget-object p1, Lorg/eclipse/jgit/transport/TagOpt;->AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

    goto :goto_0
.end method

.method public setTimeout(I)V
    .locals 0
    .parameter "seconds"

    .prologue
    .line 548
    iput p1, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->timeout:I

    .line 549
    return-void
.end method

.method public update(Lorg/eclipse/jgit/lib/Config;)V
    .locals 7
    .parameter "rc"

    .prologue
    const/4 v6, 0x0

    .line 216
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .local v2, vlst:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 219
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getURIs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/URIish;

    .line 220
    .local v1, u:Lorg/eclipse/jgit/transport/URIish;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/URIish;->toPrivateString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 221
    .end local v1           #u:Lorg/eclipse/jgit/transport/URIish;
    :cond_0
    const-string v3, "remote"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "url"

    invoke-virtual {p1, v3, v4, v5, v2}, Lorg/eclipse/jgit/lib/Config;->setStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 223
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 224
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getPushURIs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/URIish;

    .line 225
    .restart local v1       #u:Lorg/eclipse/jgit/transport/URIish;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/URIish;->toPrivateString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 226
    .end local v1           #u:Lorg/eclipse/jgit/transport/URIish;
    :cond_1
    const-string v3, "remote"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "pushurl"

    invoke-virtual {p1, v3, v4, v5, v2}, Lorg/eclipse/jgit/lib/Config;->setStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 228
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 229
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getFetchRefSpecs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/RefSpec;

    .line 230
    .local v1, u:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RefSpec;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 231
    .end local v1           #u:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_2
    const-string v3, "remote"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "fetch"

    invoke-virtual {p1, v3, v4, v5, v2}, Lorg/eclipse/jgit/lib/Config;->setStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 233
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 234
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getPushRefSpecs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/RefSpec;

    .line 235
    .restart local v1       #u:Lorg/eclipse/jgit/transport/RefSpec;
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/RefSpec;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 236
    .end local v1           #u:Lorg/eclipse/jgit/transport/RefSpec;
    :cond_3
    const-string v3, "remote"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "push"

    invoke-virtual {p1, v3, v4, v5, v2}, Lorg/eclipse/jgit/lib/Config;->setStringList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 238
    const-string v3, "uploadpack"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getUploadPack()Ljava/lang/String;

    move-result-object v4

    const-string v5, "git-upload-pack"

    invoke-direct {p0, p1, v3, v4, v5}, Lorg/eclipse/jgit/transport/RemoteConfig;->set(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    const-string v3, "receivepack"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getReceivePack()Ljava/lang/String;

    move-result-object v4

    const-string v5, "git-receive-pack"

    invoke-direct {p0, p1, v3, v4, v5}, Lorg/eclipse/jgit/transport/RemoteConfig;->set(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    const-string v3, "tagopt"

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/RemoteConfig;->getTagOpt()Lorg/eclipse/jgit/transport/TagOpt;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/TagOpt;->option()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lorg/eclipse/jgit/transport/TagOpt;->AUTO_FOLLOW:Lorg/eclipse/jgit/transport/TagOpt;

    invoke-virtual {v5}, Lorg/eclipse/jgit/transport/TagOpt;->option()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p1, v3, v4, v5}, Lorg/eclipse/jgit/transport/RemoteConfig;->set(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    const-string v3, "mirror"

    iget-boolean v4, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->mirror:Z

    invoke-direct {p0, p1, v3, v4, v6}, Lorg/eclipse/jgit/transport/RemoteConfig;->set(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;ZZ)V

    .line 242
    const-string v3, "timeout"

    iget v4, p0, Lorg/eclipse/jgit/transport/RemoteConfig;->timeout:I

    invoke-direct {p0, p1, v3, v4, v6}, Lorg/eclipse/jgit/transport/RemoteConfig;->set(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;II)V

    .line 243
    return-void
.end method
