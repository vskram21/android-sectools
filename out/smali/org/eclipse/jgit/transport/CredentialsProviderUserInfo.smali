.class public Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;
.super Ljava/lang/Object;
.source "CredentialsProviderUserInfo.java"

# interfaces
.implements Lcom/jcraft/jsch/UserInfo;
.implements Lcom/jcraft/jsch/UIKeyboardInteractive;


# instance fields
.field private passphrase:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private final provider:Lorg/eclipse/jgit/transport/CredentialsProvider;

.field private final uri:Lorg/eclipse/jgit/transport/URIish;


# direct methods
.method public constructor <init>(Lcom/jcraft/jsch/Session;Lorg/eclipse/jgit/transport/CredentialsProvider;)V
    .locals 1
    .parameter "session"
    .parameter "credentialsProvider"

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    invoke-static {p1}, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->createURI(Lcom/jcraft/jsch/Session;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->uri:Lorg/eclipse/jgit/transport/URIish;

    .line 76
    iput-object p2, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->provider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    .line 77
    return-void
.end method

.method private static createURI(Lcom/jcraft/jsch/Session;)Lorg/eclipse/jgit/transport/URIish;
    .locals 2
    .parameter "session"

    .prologue
    .line 80
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/URIish;-><init>()V

    .line 81
    .local v0, uri:Lorg/eclipse/jgit/transport/URIish;
    const-string v1, "ssh"

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/URIish;->setScheme(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    .line 82
    invoke-virtual {p0}, Lcom/jcraft/jsch/Session;->getUserName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/URIish;->setUser(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    .line 83
    invoke-virtual {p0}, Lcom/jcraft/jsch/Session;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/URIish;->setHost(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    .line 84
    invoke-virtual {p0}, Lcom/jcraft/jsch/Session;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/transport/URIish;->setPort(I)Lorg/eclipse/jgit/transport/URIish;

    move-result-object v0

    .line 85
    return-object v0
.end method

.method private newPrompt(Ljava/lang/String;)Lorg/eclipse/jgit/transport/CredentialItem$StringType;
    .locals 2
    .parameter "msg"

    .prologue
    .line 119
    new-instance v0, Lorg/eclipse/jgit/transport/CredentialItem$StringType;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lorg/eclipse/jgit/transport/CredentialItem$StringType;-><init>(Ljava/lang/String;Z)V

    return-object v0
.end method


# virtual methods
.method public getPassphrase()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->passphrase:Ljava/lang/String;

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->password:Ljava/lang/String;

    return-object v0
.end method

.method public promptKeyboardInteractive(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Z)[Ljava/lang/String;
    .locals 7
    .parameter "destination"
    .parameter "name"
    .parameter "instruction"
    .parameter "prompt"
    .parameter "echo"

    .prologue
    .line 133
    array-length v4, p4

    new-array v3, v4, [Lorg/eclipse/jgit/transport/CredentialItem$StringType;

    .line 134
    .local v3, v:[Lorg/eclipse/jgit/transport/CredentialItem$StringType;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v4, p4

    if-ge v0, v4, :cond_1

    .line 135
    new-instance v5, Lorg/eclipse/jgit/transport/CredentialItem$StringType;

    aget-object v6, p4, v0

    aget-boolean v4, p5, v0

    if-nez v4, :cond_0

    const/4 v4, 0x1

    :goto_1
    invoke-direct {v5, v6, v4}, Lorg/eclipse/jgit/transport/CredentialItem$StringType;-><init>(Ljava/lang/String;Z)V

    aput-object v5, v3, v0

    .line 134
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 135
    :cond_0
    const/4 v4, 0x0

    goto :goto_1

    .line 137
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v1, items:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/CredentialItem;>;"
    if-eqz p3, :cond_2

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 139
    new-instance v4, Lorg/eclipse/jgit/transport/CredentialItem$InformationalMessage;

    invoke-direct {v4, p3}, Lorg/eclipse/jgit/transport/CredentialItem$InformationalMessage;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    :cond_2
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 142
    iget-object v4, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->provider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->uri:Lorg/eclipse/jgit/transport/URIish;

    invoke-virtual {v4, v5, v1}, Lorg/eclipse/jgit/transport/CredentialsProvider;->get(Lorg/eclipse/jgit/transport/URIish;Ljava/util/List;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 143
    const/4 v2, 0x0

    .line 148
    :cond_3
    return-object v2

    .line 145
    :cond_4
    array-length v4, v3

    new-array v2, v4, [Ljava/lang/String;

    .line 146
    .local v2, result:[Ljava/lang/String;
    const/4 v0, 0x0

    :goto_2
    array-length v4, v3

    if-ge v0, v4, :cond_3

    .line 147
    aget-object v4, v3, v0

    invoke-virtual {v4}, Lorg/eclipse/jgit/transport/CredentialItem$StringType;->getValue()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v0

    .line 146
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method public promptPassphrase(Ljava/lang/String;)Z
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 97
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->newPrompt(Ljava/lang/String;)Lorg/eclipse/jgit/transport/CredentialItem$StringType;

    move-result-object v0

    .line 98
    .local v0, v:Lorg/eclipse/jgit/transport/CredentialItem$StringType;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->provider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->uri:Lorg/eclipse/jgit/transport/URIish;

    new-array v5, v1, [Lorg/eclipse/jgit/transport/CredentialItem;

    aput-object v0, v5, v2

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/transport/CredentialsProvider;->get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 99
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/CredentialItem$StringType;->getValue()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->passphrase:Ljava/lang/String;

    .line 103
    :goto_0
    return v1

    .line 102
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->passphrase:Ljava/lang/String;

    move v1, v2

    .line 103
    goto :goto_0
.end method

.method public promptPassword(Ljava/lang/String;)Z
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 108
    new-instance v0, Lorg/eclipse/jgit/transport/CredentialItem$Password;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/CredentialItem$Password;-><init>(Ljava/lang/String;)V

    .line 109
    .local v0, p:Lorg/eclipse/jgit/transport/CredentialItem$Password;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->provider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->uri:Lorg/eclipse/jgit/transport/URIish;

    new-array v5, v1, [Lorg/eclipse/jgit/transport/CredentialItem;

    aput-object v0, v5, v2

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/transport/CredentialsProvider;->get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 110
    new-instance v2, Ljava/lang/String;

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/CredentialItem$Password;->getValue()[C

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/String;-><init>([C)V

    iput-object v2, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->password:Ljava/lang/String;

    .line 114
    :goto_0
    return v1

    .line 113
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->password:Ljava/lang/String;

    move v1, v2

    .line 114
    goto :goto_0
.end method

.method public promptYesNo(Ljava/lang/String;)Z
    .locals 6
    .parameter "msg"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 123
    new-instance v0, Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;-><init>(Ljava/lang/String;)V

    .line 124
    .local v0, v:Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;
    iget-object v3, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->provider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    iget-object v4, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->uri:Lorg/eclipse/jgit/transport/URIish;

    new-array v5, v1, [Lorg/eclipse/jgit/transport/CredentialItem;

    aput-object v0, v5, v2

    invoke-virtual {v3, v4, v5}, Lorg/eclipse/jgit/transport/CredentialsProvider;->get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/CredentialItem$YesNoType;->getValue()Z

    move-result v3

    if-eqz v3, :cond_0

    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method

.method public showMessage(Ljava/lang/String;)V
    .locals 5
    .parameter "msg"

    .prologue
    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->provider:Lorg/eclipse/jgit/transport/CredentialsProvider;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/CredentialsProviderUserInfo;->uri:Lorg/eclipse/jgit/transport/URIish;

    const/4 v2, 0x1

    new-array v2, v2, [Lorg/eclipse/jgit/transport/CredentialItem;

    const/4 v3, 0x0

    new-instance v4, Lorg/eclipse/jgit/transport/CredentialItem$InformationalMessage;

    invoke-direct {v4, p1}, Lorg/eclipse/jgit/transport/CredentialItem$InformationalMessage;-><init>(Ljava/lang/String;)V

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/transport/CredentialsProvider;->get(Lorg/eclipse/jgit/transport/URIish;[Lorg/eclipse/jgit/transport/CredentialItem;)Z

    .line 129
    return-void
.end method
