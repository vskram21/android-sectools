.class public Lorg/eclipse/jgit/lib/UserConfig;
.super Ljava/lang/Object;
.source "UserConfig.java"


# static fields
.field public static final KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/eclipse/jgit/lib/Config$SectionParser",
            "<",
            "Lorg/eclipse/jgit/lib/UserConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private authorEmail:Ljava/lang/String;

.field private authorName:Ljava/lang/String;

.field private committerEmail:Ljava/lang/String;

.field private committerName:Ljava/lang/String;

.field private isAuthorEmailImplicit:Z

.field private isAuthorNameImplicit:Z

.field private isCommitterEmailImplicit:Z

.field private isCommitterNameImplicit:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    new-instance v0, Lorg/eclipse/jgit/lib/UserConfig$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/UserConfig$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/lib/UserConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    return-void
.end method

.method private constructor <init>(Lorg/eclipse/jgit/lib/Config;)V
    .locals 2
    .parameter "rc"

    .prologue
    const/4 v1, 0x1

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    const-string v0, "GIT_AUTHOR_NAME"

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/UserConfig;->getNameInternal(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->authorName:Ljava/lang/String;

    .line 78
    iget-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->authorName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 79
    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->getDefaultUserName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->authorName:Ljava/lang/String;

    .line 80
    iput-boolean v1, p0, Lorg/eclipse/jgit/lib/UserConfig;->isAuthorNameImplicit:Z

    .line 82
    :cond_0
    const-string v0, "GIT_AUTHOR_EMAIL"

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/UserConfig;->getEmailInternal(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->authorEmail:Ljava/lang/String;

    .line 83
    iget-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->authorEmail:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 84
    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->getDefaultEmail()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->authorEmail:Ljava/lang/String;

    .line 85
    iput-boolean v1, p0, Lorg/eclipse/jgit/lib/UserConfig;->isAuthorEmailImplicit:Z

    .line 88
    :cond_1
    const-string v0, "GIT_COMMITTER_NAME"

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/UserConfig;->getNameInternal(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->committerName:Ljava/lang/String;

    .line 89
    iget-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->committerName:Ljava/lang/String;

    if-nez v0, :cond_2

    .line 90
    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->getDefaultUserName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->committerName:Ljava/lang/String;

    .line 91
    iput-boolean v1, p0, Lorg/eclipse/jgit/lib/UserConfig;->isCommitterNameImplicit:Z

    .line 93
    :cond_2
    const-string v0, "GIT_COMMITTER_EMAIL"

    invoke-static {p1, v0}, Lorg/eclipse/jgit/lib/UserConfig;->getEmailInternal(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->committerEmail:Ljava/lang/String;

    .line 94
    iget-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->committerEmail:Ljava/lang/String;

    if-nez v0, :cond_3

    .line 95
    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->getDefaultEmail()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->committerEmail:Ljava/lang/String;

    .line 96
    iput-boolean v1, p0, Lorg/eclipse/jgit/lib/UserConfig;->isCommitterEmailImplicit:Z

    .line 98
    :cond_3
    return-void
.end method

.method synthetic constructor <init>(Lorg/eclipse/jgit/lib/Config;Lorg/eclipse/jgit/lib/UserConfig$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/UserConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    return-void
.end method

.method private static getDefaultEmail()Ljava/lang/String;
    .locals 3

    .prologue
    .line 216
    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->getDefaultUserName()Ljava/lang/String;

    move-result-object v0

    .line 217
    .local v0, username:Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->system()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/util/SystemReader;->getHostname()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static getDefaultUserName()Ljava/lang/String;
    .locals 3

    .prologue
    .line 192
    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->system()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v1

    const-string v2, "user.name"

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/util/SystemReader;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, username:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 194
    const-string v0, "unknown-user"

    .line 195
    :cond_0
    return-object v0
.end method

.method private static getEmailInternal(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "rc"
    .parameter "envKey"

    .prologue
    .line 200
    const-string v1, "user"

    const/4 v2, 0x0

    const-string v3, "email"

    invoke-virtual {p0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 202
    .local v0, email:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 204
    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->system()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 207
    :cond_0
    return-object v0
.end method

.method private static getNameInternal(Lorg/eclipse/jgit/lib/Config;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "rc"
    .parameter "envKey"

    .prologue
    .line 176
    const-string v1, "user"

    const/4 v2, 0x0

    const-string v3, "name"

    invoke-virtual {p0, v1, v2, v3}, Lorg/eclipse/jgit/lib/Config;->getString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 178
    .local v0, username:Ljava/lang/String;
    if-nez v0, :cond_0

    .line 180
    invoke-static {}, Lorg/eclipse/jgit/lib/UserConfig;->system()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/util/SystemReader;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 183
    :cond_0
    return-object v0
.end method

.method private static system()Lorg/eclipse/jgit/util/SystemReader;
    .locals 1

    .prologue
    .line 221
    invoke-static {}, Lorg/eclipse/jgit/util/SystemReader;->getInstance()Lorg/eclipse/jgit/util/SystemReader;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getAuthorEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->authorEmail:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthorName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->authorName:Ljava/lang/String;

    return-object v0
.end method

.method public getCommitterEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->committerEmail:Ljava/lang/String;

    return-object v0
.end method

.method public getCommitterName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->committerName:Ljava/lang/String;

    return-object v0
.end method

.method public isAuthorEmailImplicit()Z
    .locals 1

    .prologue
    .line 153
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->isAuthorEmailImplicit:Z

    return v0
.end method

.method public isAuthorNameImplicit()Z
    .locals 1

    .prologue
    .line 144
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->isAuthorNameImplicit:Z

    return v0
.end method

.method public isCommitterEmailImplicit()Z
    .locals 1

    .prologue
    .line 171
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->isCommitterEmailImplicit:Z

    return v0
.end method

.method public isCommitterNameImplicit()Z
    .locals 1

    .prologue
    .line 162
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/UserConfig;->isCommitterNameImplicit:Z

    return v0
.end method
