.class abstract Lorg/eclipse/jgit/transport/HttpAuthMethod;
.super Ljava/lang/Object;
.source "HttpAuthMethod.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/HttpAuthMethod$1;,
        Lorg/eclipse/jgit/transport/HttpAuthMethod$Basic;,
        Lorg/eclipse/jgit/transport/HttpAuthMethod$Digest;,
        Lorg/eclipse/jgit/transport/HttpAuthMethod$Negotiate;,
        Lorg/eclipse/jgit/transport/HttpAuthMethod$None;,
        Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
    }
.end annotation


# static fields
.field static final EMPTY_STRING:Ljava/lang/String; = ""

.field static final SCHEMA_NAME_SEPARATOR:Ljava/lang/String; = " "


# instance fields
.field protected final type:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;)V
    .locals 0
    .parameter "type"

    .prologue
    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    iput-object p1, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod;->type:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    .line 197
    return-void
.end method

.method static scanResponse(Lorg/eclipse/jgit/transport/http/HttpConnection;)Lorg/eclipse/jgit/transport/HttpAuthMethod;
    .locals 11
    .parameter "conn"

    .prologue
    const/4 v10, 0x1

    .line 155
    invoke-interface {p0}, Lorg/eclipse/jgit/transport/http/HttpConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v2

    .line 156
    .local v2, headers:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    sget-object v8, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->NONE:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    const-string v9, ""

    invoke-virtual {v8, v9}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->method(Ljava/lang/String;)Lorg/eclipse/jgit/transport/HttpAuthMethod;

    move-result-object v0

    .line 158
    .local v0, authentication:Lorg/eclipse/jgit/transport/HttpAuthMethod;
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 159
    .local v1, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const-string v9, "WWW-Authenticate"

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v9, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 160
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_3

    .line 161
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 162
    .local v6, value:Ljava/lang/String;
    if-eqz v6, :cond_1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_1

    .line 163
    const-string v8, " "

    const/4 v9, 0x2

    invoke-virtual {v6, v8, v9}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    .line 167
    .local v7, valuePart:[Ljava/lang/String;
    const/4 v8, 0x0

    :try_start_0
    aget-object v8, v7, v8

    invoke-virtual {v8}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->valueOf(Ljava/lang/String;)Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    move-result-object v4

    .line 168
    .local v4, methodType:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/HttpAuthMethod;->getType()Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    move-result-object v8

    invoke-virtual {v8, v4}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->compareTo(Ljava/lang/Enum;)I

    move-result v8

    if-gez v8, :cond_1

    .line 173
    array-length v8, v7

    if-ne v8, v10, :cond_2

    .line 174
    const-string v5, ""

    .line 178
    .local v5, param:Ljava/lang/String;
    :goto_1
    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;->method(Ljava/lang/String;)Lorg/eclipse/jgit/transport/HttpAuthMethod;

    move-result-object v0

    goto :goto_0

    .line 176
    .end local v5           #param:Ljava/lang/String;
    :cond_2
    const/4 v8, 0x1

    aget-object v5, v7, v8
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .restart local v5       #param:Ljava/lang/String;
    goto :goto_1

    .line 190
    .end local v1           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v4           #methodType:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
    .end local v5           #param:Ljava/lang/String;
    .end local v6           #value:Ljava/lang/String;
    .end local v7           #valuePart:[Ljava/lang/String;
    :cond_3
    return-object v0

    .line 180
    .restart local v1       #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .restart local v6       #value:Ljava/lang/String;
    .restart local v7       #valuePart:[Ljava/lang/String;
    :catch_0
    move-exception v8

    goto :goto_0
.end method


# virtual methods
.method abstract authorize(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method authorize(Lorg/eclipse/jgit/transport/URIish;Lorg/eclipse/jgit/transport/CredentialsProvider;)Z
    .locals 8
    .parameter "uri"
    .parameter "credentialsProvider"

    .prologue
    const/4 v7, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 215
    if-eqz p2, :cond_1

    .line 216
    new-instance v2, Lorg/eclipse/jgit/transport/CredentialItem$Username;

    invoke-direct {v2}, Lorg/eclipse/jgit/transport/CredentialItem$Username;-><init>()V

    .line 217
    .local v2, u:Lorg/eclipse/jgit/transport/CredentialItem$Username;
    new-instance v0, Lorg/eclipse/jgit/transport/CredentialItem$Password;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/CredentialItem$Password;-><init>()V

    .line 219
    .local v0, p:Lorg/eclipse/jgit/transport/CredentialItem$Password;
    new-array v6, v7, [Lorg/eclipse/jgit/transport/CredentialItem;

    aput-object v2, v6, v4

    aput-object v0, v6, v5

    invoke-virtual {p2, v6}, Lorg/eclipse/jgit/transport/CredentialsProvider;->supports([Lorg/eclipse/jgit/transport/CredentialItem;)Z

    move-result v6

    if-eqz v6, :cond_0

    new-array v6, v7, [Lorg/eclipse/jgit/transport/CredentialItem;

    aput-object v2, v6, v4

    aput-object v0, v6, v5

    invoke-virtual {p2, p1, v6}, Lorg/eclipse/jgit/transport/CredentialsProvider;->get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 221
    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/CredentialItem$Username;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 222
    .local v3, username:Ljava/lang/String;
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/CredentialItem$Password;->getValue()[C

    move-result-object v6

    invoke-direct {v1, v6}, Ljava/lang/String;-><init>([C)V

    .line 223
    .local v1, password:Ljava/lang/String;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/CredentialItem$Password;->clear()V

    .line 230
    .end local v0           #p:Lorg/eclipse/jgit/transport/CredentialItem$Password;
    .end local v2           #u:Lorg/eclipse/jgit/transport/CredentialItem$Username;
    :goto_0
    if-eqz v3, :cond_0

    .line 231
    invoke-virtual {p0, v3, v1}, Lorg/eclipse/jgit/transport/HttpAuthMethod;->authorize(Ljava/lang/String;Ljava/lang/String;)V

    move v4, v5

    .line 234
    .end local v1           #password:Ljava/lang/String;
    .end local v3           #username:Ljava/lang/String;
    :cond_0
    return v4

    .line 227
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v3

    .line 228
    .restart local v3       #username:Ljava/lang/String;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v1

    .restart local v1       #password:Ljava/lang/String;
    goto :goto_0
.end method

.method abstract configureRequest(Lorg/eclipse/jgit/transport/http/HttpConnection;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public getType()Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;
    .locals 1

    .prologue
    .line 259
    iget-object v0, p0, Lorg/eclipse/jgit/transport/HttpAuthMethod;->type:Lorg/eclipse/jgit/transport/HttpAuthMethod$Type;

    return-object v0
.end method
