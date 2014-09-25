.class public Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;
.super Lorg/eclipse/jgit/transport/CredentialsProvider;
.source "UsernamePasswordCredentialsProvider.java"


# instance fields
.field private password:[C

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "username"
    .parameter "password"

    .prologue
    .line 65
    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;-><init>(Ljava/lang/String;[C)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[C)V
    .locals 0
    .parameter "username"
    .parameter "password"

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/CredentialsProvider;-><init>()V

    .line 75
    iput-object p1, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->username:Ljava/lang/String;

    .line 76
    iput-object p2, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->password:[C

    .line 77
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 126
    iput-object v2, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->username:Ljava/lang/String;

    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->password:[C

    if-eqz v0, :cond_0

    .line 129
    iget-object v0, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->password:[C

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([CC)V

    .line 130
    iput-object v2, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->password:[C

    .line 132
    :cond_0
    return-void
.end method

.method public varargs get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z
    .locals 7
    .parameter "uri"
    .parameter "items"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/UnsupportedCredentialItem;
        }
    .end annotation

    .prologue
    .line 102
    move-object v0, p2

    .local v0, arr$:[Lorg/eclipse/jgit/transport/CredentialItem;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_3

    aget-object v1, v0, v2

    .line 103
    .local v1, i:Lorg/eclipse/jgit/transport/CredentialItem;
    instance-of v4, v1, Lorg/eclipse/jgit/transport/CredentialItem$Username;

    if-eqz v4, :cond_0

    .line 104
    check-cast v1, Lorg/eclipse/jgit/transport/CredentialItem$Username;

    .end local v1           #i:Lorg/eclipse/jgit/transport/CredentialItem;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->username:Ljava/lang/String;

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/transport/CredentialItem$Username;->setValue(Ljava/lang/String;)V

    .line 102
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 107
    .restart local v1       #i:Lorg/eclipse/jgit/transport/CredentialItem;
    :cond_0
    instance-of v4, v1, Lorg/eclipse/jgit/transport/CredentialItem$Password;

    if-eqz v4, :cond_1

    .line 108
    check-cast v1, Lorg/eclipse/jgit/transport/CredentialItem$Password;

    .end local v1           #i:Lorg/eclipse/jgit/transport/CredentialItem;
    iget-object v4, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->password:[C

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/transport/CredentialItem$Password;->setValue([C)V

    goto :goto_1

    .line 111
    .restart local v1       #i:Lorg/eclipse/jgit/transport/CredentialItem;
    :cond_1
    instance-of v4, v1, Lorg/eclipse/jgit/transport/CredentialItem$StringType;

    if-eqz v4, :cond_2

    .line 112
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/CredentialItem;->getPromptText()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Password: "

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 113
    check-cast v1, Lorg/eclipse/jgit/transport/CredentialItem$StringType;

    .end local v1           #i:Lorg/eclipse/jgit/transport/CredentialItem;
    new-instance v4, Ljava/lang/String;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/UsernamePasswordCredentialsProvider;->password:[C

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/transport/CredentialItem$StringType;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 118
    .restart local v1       #i:Lorg/eclipse/jgit/transport/CredentialItem;
    :cond_2
    new-instance v4, Lorg/eclipse/jgit/errors/UnsupportedCredentialItem;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/CredentialItem;->getPromptText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, p1, v5}, Lorg/eclipse/jgit/errors/UnsupportedCredentialItem;-><init>(Lorg/eclipse/jgit/transport/URIish;Ljava/lang/String;)V

    throw v4

    .line 121
    .end local v1           #i:Lorg/eclipse/jgit/transport/CredentialItem;
    :cond_3
    const/4 v4, 0x1

    return v4
.end method

.method public isInteractive()Z
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x0

    return v0
.end method

.method public varargs supports([Lorg/eclipse/jgit/transport/CredentialItem;)Z
    .locals 5
    .parameter "items"

    .prologue
    .line 86
    move-object v0, p1

    .local v0, arr$:[Lorg/eclipse/jgit/transport/CredentialItem;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 87
    .local v1, i:Lorg/eclipse/jgit/transport/CredentialItem;
    instance-of v4, v1, Lorg/eclipse/jgit/transport/CredentialItem$Username;

    if-eqz v4, :cond_1

    .line 86
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 90
    :cond_1
    instance-of v4, v1, Lorg/eclipse/jgit/transport/CredentialItem$Password;

    if-nez v4, :cond_0

    .line 94
    const/4 v4, 0x0

    .line 96
    .end local v1           #i:Lorg/eclipse/jgit/transport/CredentialItem;
    :goto_1
    return v4

    :cond_2
    const/4 v4, 0x1

    goto :goto_1
.end method
