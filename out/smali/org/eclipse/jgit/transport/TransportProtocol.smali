.class public abstract Lorg/eclipse/jgit/transport/TransportProtocol;
.super Ljava/lang/Object;
.source "TransportProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/TransportProtocol$1;,
        Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    return-void
.end method


# virtual methods
.method public canHandle(Lorg/eclipse/jgit/transport/URIish;)Z
    .locals 1
    .parameter "uri"

    .prologue
    const/4 v0, 0x0

    .line 147
    invoke-virtual {p0, p1, v0, v0}, Lorg/eclipse/jgit/transport/TransportProtocol;->canHandle(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public canHandle(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Z
    .locals 6
    .parameter "uri"
    .parameter "local"
    .parameter "remoteName"

    .prologue
    const/4 v3, 0x0

    .line 176
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;->getSchemes()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;->getSchemes()Ljava/util/Set;

    move-result-object v4

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 225
    :cond_0
    :goto_0
    return v3

    .line 179
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;->getRequiredFields()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    .line 180
    .local v1, field:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;
    sget-object v4, Lorg/eclipse/jgit/transport/TransportProtocol$1;->$SwitchMap$org$eclipse$jgit$transport$TransportProtocol$URIishField:[I

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    .line 182
    :pswitch_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_0

    .line 187
    :pswitch_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_0

    .line 192
    :pswitch_2
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_0

    .line 197
    :pswitch_3
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v4

    if-gtz v4, :cond_2

    goto :goto_0

    .line 202
    :pswitch_4
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_0

    .line 211
    .end local v1           #field:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;->getRequiredFields()Ljava/util/Set;

    move-result-object v4

    invoke-static {v4}, Ljava/util/EnumSet;->copyOf(Ljava/util/Collection;)Ljava/util/EnumSet;

    move-result-object v0

    .line 212
    .local v0, canHave:Ljava/util/Set;,"Ljava/util/Set<Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;>;"
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/TransportProtocol;->getOptionalFields()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 214
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_4

    sget-object v4, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->USER:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 216
    :cond_4
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_5

    sget-object v4, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PASS:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 218
    :cond_5
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_6

    sget-object v4, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->HOST:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 220
    :cond_6
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v4

    if-lez v4, :cond_7

    sget-object v4, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PORT:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 222
    :cond_7
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_8

    sget-object v4, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PATH:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 225
    :cond_8
    const/4 v3, 0x1

    goto/16 :goto_0

    .line 180
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public getDefaultPort()I
    .locals 1

    .prologue
    .line 125
    const/4 v0, -0x1

    return v0
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public getOptionalFields()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getRequiredFields()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 115
    sget-object v0, Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;->PATH:Lorg/eclipse/jgit/transport/TransportProtocol$URIishField;

    invoke-static {v0}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSchemes()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 110
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public open(Lorg/eclipse/jgit/transport/URIish;)Lorg/eclipse/jgit/transport/Transport;
    .locals 2
    .parameter "uri"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation

    .prologue
    .line 269
    new-instance v0, Lorg/eclipse/jgit/errors/NotSupportedException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->transportNeedsRepository:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/errors/NotSupportedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract open(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)Lorg/eclipse/jgit/transport/Transport;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/NotSupportedException;,
            Lorg/eclipse/jgit/errors/TransportException;
        }
    .end annotation
.end method
