.class public Lorg/eclipse/jgit/transport/URIish;
.super Ljava/lang/Object;
.source "URIish.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final ABSOLUTE_SCP_URI:Ljava/util/regex/Pattern; = null

.field private static final FULL_URI:Ljava/util/regex/Pattern; = null

.field private static final HOST_P:Ljava/lang/String; = "((?:[^\\\\/:]+)|(?:\\[[0-9a-f:]+\\]))"

.field private static final LOCAL_FILE:Ljava/util/regex/Pattern; = null

.field private static final OPT_DRIVE_LETTER_P:Ljava/lang/String; = "(?:[A-Za-z]:)?"

.field private static final OPT_PORT_P:Ljava/lang/String; = "(?::(\\d+))?"

.field private static final OPT_USER_PWD_P:Ljava/lang/String; = "(?:([^/:@]+)(?::([^\\\\/]+))?@)?"

.field private static final PATH_P:Ljava/lang/String; = "((?:[A-Za-z]:)?[\\\\/]?(?:(?:[^\\\\/]+[\\\\/]+)*[^\\\\/]+[\\\\/]*))"

.field private static final RELATIVE_PATH_P:Ljava/lang/String; = "(?:(?:[^\\\\/]+[\\\\/]+)*[^\\\\/]+[\\\\/]*)"

.field private static final RELATIVE_SCP_URI:Ljava/util/regex/Pattern; = null

.field private static final SCHEME_P:Ljava/lang/String; = "([a-z][a-z0-9+-]+)://"

.field private static final SINGLE_SLASH_FILE_URI:Ljava/util/regex/Pattern; = null

.field private static final USER_HOME_P:Ljava/lang/String; = "(?:/~(?:[^\\\\/]+))"

.field private static final reservedChars:Ljava/util/BitSet; = null

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private host:Ljava/lang/String;

.field private pass:Ljava/lang/String;

.field private path:Ljava/lang/String;

.field private port:I

.field private rawPath:Ljava/lang/String;

.field private scheme:Ljava/lang/String;

.field private user:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    .line 130
    const-string v4, "^([a-z][a-z0-9+-]+)://(?:(?:([^/:@]+)(?::([^\\\\/]+))?@)?((?:[^\\\\/:]+)|(?:\\[[0-9a-f:]+\\]))(?::(\\d+))?((?:/~(?:[^\\\\/]+))?[\\\\/]))?(.+)?$"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/transport/URIish;->FULL_URI:Ljava/util/regex/Pattern;

    .line 148
    const-string v4, "^([\\\\/]?((?:[A-Za-z]:)?[\\\\/]?(?:(?:[^\\\\/]+[\\\\/]+)*[^\\\\/]+[\\\\/]*)))$"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/transport/URIish;->LOCAL_FILE:Ljava/util/regex/Pattern;

    .line 157
    const-string v4, "^(file):([\\\\/](?![\\\\/])((?:[A-Za-z]:)?[\\\\/]?(?:(?:[^\\\\/]+[\\\\/]+)*[^\\\\/]+[\\\\/]*)))$"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/transport/URIish;->SINGLE_SLASH_FILE_URI:Ljava/util/regex/Pattern;

    .line 165
    const-string v4, "^(?:([^/:@]+)(?::([^\\\\/]+))?@)?((?:[^\\\\/:]+)|(?:\\[[0-9a-f:]+\\])):((?:(?:/~(?:[^\\\\/]+))[\\\\/])?(?:(?:[^\\\\/]+[\\\\/]+)*[^\\\\/]+[\\\\/]*))$"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/transport/URIish;->RELATIVE_SCP_URI:Ljava/util/regex/Pattern;

    .line 176
    const-string v4, "^(?:([^/:@]+)(?::([^\\\\/]+))?@)?([^\\\\/:]{2,}):([\\\\/](?:(?:[^\\\\/]+[\\\\/]+)*[^\\\\/]+[\\\\/]*))$"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    sput-object v4, Lorg/eclipse/jgit/transport/URIish;->ABSOLUTE_SCP_URI:Ljava/util/regex/Pattern;

    .line 285
    new-instance v4, Ljava/util/BitSet;

    const/16 v5, 0x7f

    invoke-direct {v4, v5}, Ljava/util/BitSet;-><init>(I)V

    sput-object v4, Lorg/eclipse/jgit/transport/URIish;->reservedChars:Ljava/util/BitSet;

    .line 288
    const-string v4, "!*\'();:@&=+$,/?#[]"

    invoke-static {v4}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    .local v0, arr$:[B
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-byte v1, v0, v2

    .line 289
    .local v1, b:B
    sget-object v4, Lorg/eclipse/jgit/transport/URIish;->reservedChars:Ljava/util/BitSet;

    invoke-virtual {v4, v1}, Ljava/util/BitSet;->set(I)V

    .line 288
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 290
    .end local v1           #b:B
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 381
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 193
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/transport/URIish;->port:I

    .line 383
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 7
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x5

    const/4 v5, 0x4

    const/4 v4, 0x3

    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 193
    const/4 v1, -0x1

    iput v1, p0, Lorg/eclipse/jgit/transport/URIish;->port:I

    .line 204
    invoke-static {p1}, Lorg/eclipse/jgit/util/StringUtils;->isEmptyOrNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 205
    new-instance v1, Ljava/net/URISyntaxException;

    const-string v2, "The uri was empty or null"

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->cannotParseGitURIish:Ljava/lang/String;

    invoke-direct {v1, v2, v3}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1

    .line 208
    :cond_0
    sget-object v1, Lorg/eclipse/jgit/transport/URIish;->SINGLE_SLASH_FILE_URI:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 209
    .local v0, matcher:Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 210
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    .line 211
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lorg/eclipse/jgit/transport/URIish;->cleanLeadingSlashes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    .line 212
    iget-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/transport/URIish;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    .line 250
    :goto_0
    return-void

    .line 215
    :cond_1
    sget-object v1, Lorg/eclipse/jgit/transport/URIish;->FULL_URI:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 216
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 217
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    .line 218
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/transport/URIish;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->user:Ljava/lang/String;

    .line 219
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/transport/URIish;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->pass:Ljava/lang/String;

    .line 220
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/transport/URIish;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->host:Ljava/lang/String;

    .line 221
    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 222
    invoke-virtual {v0, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/transport/URIish;->port:I

    .line 223
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x6

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/URIish;->n2e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x7

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/transport/URIish;->n2e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    invoke-direct {p0, v1, v2}, Lorg/eclipse/jgit/transport/URIish;->cleanLeadingSlashes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    .line 225
    iget-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    invoke-static {v1}, Lorg/eclipse/jgit/transport/URIish;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    goto :goto_0

    .line 228
    :cond_3
    sget-object v1, Lorg/eclipse/jgit/transport/URIish;->RELATIVE_SCP_URI:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 229
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 230
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->user:Ljava/lang/String;

    .line 231
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->pass:Ljava/lang/String;

    .line 232
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->host:Ljava/lang/String;

    .line 233
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    .line 234
    iget-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    goto/16 :goto_0

    .line 237
    :cond_4
    sget-object v1, Lorg/eclipse/jgit/transport/URIish;->ABSOLUTE_SCP_URI:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 238
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 239
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->user:Ljava/lang/String;

    .line 240
    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->pass:Ljava/lang/String;

    .line 241
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->host:Ljava/lang/String;

    .line 242
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    .line 243
    iget-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    goto/16 :goto_0

    .line 246
    :cond_5
    sget-object v1, Lorg/eclipse/jgit/transport/URIish;->LOCAL_FILE:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 247
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 248
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    .line 249
    iget-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    iput-object v1, p0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    goto/16 :goto_0

    .line 252
    :cond_6
    new-instance v1, Ljava/net/URISyntaxException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->cannotParseGitURIish:Ljava/lang/String;

    invoke-direct {v1, p1, v2}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .locals 4
    .parameter "u"

    .prologue
    .line 360
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 193
    const/4 v3, -0x1

    iput v3, p0, Lorg/eclipse/jgit/transport/URIish;->port:I

    .line 361
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    .line 362
    invoke-virtual {p1}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    .line 364
    :try_start_0
    invoke-virtual {p1}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v3

    invoke-virtual {v3}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 369
    invoke-virtual {p1}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v2

    .line 370
    .local v2, ui:Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 371
    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 372
    .local v0, d:I
    if-gez v0, :cond_1

    move-object v3, v2

    :goto_0
    iput-object v3, p0, Lorg/eclipse/jgit/transport/URIish;->user:Ljava/lang/String;

    .line 373
    if-gez v0, :cond_2

    const/4 v3, 0x0

    :goto_1
    iput-object v3, p0, Lorg/eclipse/jgit/transport/URIish;->pass:Ljava/lang/String;

    .line 376
    .end local v0           #d:I
    :cond_0
    invoke-virtual {p1}, Ljava/net/URL;->getPort()I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/transport/URIish;->port:I

    .line 377
    invoke-virtual {p1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/transport/URIish;->host:Ljava/lang/String;

    .line 378
    return-void

    .line 365
    .end local v2           #ui:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 366
    .local v1, e:Ljava/net/URISyntaxException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 372
    .end local v1           #e:Ljava/net/URISyntaxException;
    .restart local v0       #d:I
    .restart local v2       #ui:Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 373
    :cond_2
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method private constructor <init>(Lorg/eclipse/jgit/transport/URIish;)V
    .locals 1
    .parameter "u"

    .prologue
    .line 385
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 193
    const/4 v0, -0x1

    iput v0, p0, Lorg/eclipse/jgit/transport/URIish;->port:I

    .line 386
    iget-object v0, p1, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    .line 387
    iget-object v0, p1, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    .line 388
    iget-object v0, p1, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    .line 389
    iget-object v0, p1, Lorg/eclipse/jgit/transport/URIish;->user:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->user:Ljava/lang/String;

    .line 390
    iget-object v0, p1, Lorg/eclipse/jgit/transport/URIish;->pass:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->pass:Ljava/lang/String;

    .line 391
    iget v0, p1, Lorg/eclipse/jgit/transport/URIish;->port:I

    iput v0, p0, Lorg/eclipse/jgit/transport/URIish;->port:I

    .line 392
    iget-object v0, p1, Lorg/eclipse/jgit/transport/URIish;->host:Ljava/lang/String;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->host:Ljava/lang/String;

    .line 393
    return-void
.end method

.method private cleanLeadingSlashes(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .parameter "p"
    .parameter "s"

    .prologue
    const/16 v5, 0x2f

    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 341
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_3

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v5, :cond_3

    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x3a

    if-ne v0, v1, :cond_3

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x41

    if-lt v0, v1, :cond_0

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5a

    if-le v0, v1, :cond_1

    :cond_0
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-lt v0, v1, :cond_3

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x7a

    if-gt v0, v1, :cond_3

    .line 346
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 351
    .end local p1
    :cond_2
    :goto_0
    return-object p1

    .line 347
    .restart local p1
    :cond_3
    if-eqz p2, :cond_2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v4, :cond_2

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, v5, :cond_2

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x7e

    if-ne v0, v1, :cond_2

    .line 349
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0
.end method

.method private static eq(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .parameter "a"
    .parameter "b"

    .prologue
    .line 582
    if-ne p0, p1, :cond_0

    .line 583
    const/4 v0, 0x1

    .line 586
    :goto_0
    return v0

    .line 584
    :cond_0
    if-eqz p0, :cond_1

    if-nez p1, :cond_2

    .line 585
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 586
    :cond_2
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method private static escape(Ljava/lang/String;ZZ)Ljava/lang/String;
    .locals 13
    .parameter "s"
    .parameter "escapeReservedChars"
    .parameter "encodeNonAscii"

    .prologue
    const/16 v12, 0x25

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 305
    if-nez p0, :cond_0

    .line 306
    const/4 v7, 0x0

    .line 328
    :goto_0
    return-object v7

    .line 307
    :cond_0
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-direct {v5, v7}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 310
    .local v5, os:Ljava/io/ByteArrayOutputStream;
    :try_start_0
    const-string v7, "UTF-8"

    invoke-virtual {p0, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 314
    .local v2, bytes:[B
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1
    array-length v7, v2

    if-ge v4, v7, :cond_4

    .line 315
    aget-byte v7, v2, v4

    and-int/lit16 v0, v7, 0xff

    .line 316
    .local v0, b:I
    const/16 v7, 0x20

    if-le v0, v7, :cond_2

    if-eqz p2, :cond_1

    const/16 v7, 0x7f

    if-gt v0, v7, :cond_2

    :cond_1
    if-eq v0, v12, :cond_2

    if-eqz p1, :cond_3

    sget-object v7, Lorg/eclipse/jgit/transport/URIish;->reservedChars:Ljava/util/BitSet;

    invoke-virtual {v7, v0}, Ljava/util/BitSet;->get(I)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 318
    :cond_2
    invoke-virtual {v5, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 319
    const-string v7, "%02x"

    new-array v8, v11, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v6

    .line 321
    .local v6, tmp:[B
    aget-byte v7, v6, v10

    invoke-virtual {v5, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 322
    aget-byte v7, v6, v11

    invoke-virtual {v5, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 314
    .end local v6           #tmp:[B
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 311
    .end local v0           #b:I
    .end local v2           #bytes:[B
    .end local v4           #i:I
    :catch_0
    move-exception v3

    .line 312
    .local v3, e:Ljava/io/UnsupportedEncodingException;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 324
    .end local v3           #e:Ljava/io/UnsupportedEncodingException;
    .restart local v0       #b:I
    .restart local v2       #bytes:[B
    .restart local v4       #i:I
    :cond_3
    invoke-virtual {v5, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_2

    .line 327
    .end local v0           #b:I
    :cond_4
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    .line 328
    .local v1, buf:[B
    array-length v7, v1

    invoke-static {v1, v10, v7}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v7

    goto :goto_0
.end method

.method private format(ZZ)Ljava/lang/String;
    .locals 5
    .parameter "includePassword"
    .parameter "escapeNonAscii"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/16 v2, 0x3a

    .line 603
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 604
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 605
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 606
    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 609
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 610
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v4, p2}, Lorg/eclipse/jgit/transport/URIish;->escape(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 611
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 612
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 613
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v4, p2}, Lorg/eclipse/jgit/transport/URIish;->escape(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 618
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 619
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 620
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3, p2}, Lorg/eclipse/jgit/transport/URIish;->escape(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 621
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v1

    if-lez v1, :cond_3

    .line 622
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 623
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 627
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 628
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 629
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 630
    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 633
    :cond_4
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 634
    if-eqz p2, :cond_7

    .line 635
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v3, p2}, Lorg/eclipse/jgit/transport/URIish;->escape(Ljava/lang/String;ZZ)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 642
    :cond_5
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 631
    :cond_6
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 632
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 637
    :cond_7
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getRawPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 639
    :cond_8
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1
.end method

.method private n2e(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .parameter "s"

    .prologue
    .line 332
    if-nez p1, :cond_0

    .line 333
    const-string p1, ""

    .line 335
    .end local p1
    :cond_0
    return-object p1
.end method

.method private static unescape(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "s"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x25

    .line 256
    if-nez p0, :cond_1

    .line 257
    const/4 p0, 0x0

    .line 282
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .line 258
    .restart local p0
    :cond_1
    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v8

    if-ltz v8, :cond_0

    .line 263
    :try_start_0
    const-string v8, "UTF-8"

    invoke-virtual {p0, v8}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 268
    .local v0, bytes:[B
    array-length v8, v0

    new-array v6, v8, [B

    .line 269
    .local v6, os:[B
    const/4 v4, 0x0

    .line 270
    .local v4, j:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_1
    array-length v8, v0

    if-ge v3, v8, :cond_4

    .line 271
    aget-byte v1, v0, v3

    .line 272
    .local v1, c:B
    if-ne v1, v10, :cond_3

    .line 273
    add-int/lit8 v8, v3, 0x2

    array-length v9, v0

    if-lt v8, v9, :cond_2

    .line 274
    new-instance v8, Ljava/net/URISyntaxException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->cannotParseGitURIish:Ljava/lang/String;

    invoke-direct {v8, p0, v9}, Ljava/net/URISyntaxException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v8

    .line 264
    .end local v0           #bytes:[B
    .end local v1           #c:B
    .end local v3           #i:I
    .end local v4           #j:I
    .end local v6           #os:[B
    :catch_0
    move-exception v2

    .line 265
    .local v2, e:Ljava/io/UnsupportedEncodingException;
    new-instance v8, Ljava/lang/RuntimeException;

    invoke-direct {v8, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 275
    .end local v2           #e:Ljava/io/UnsupportedEncodingException;
    .restart local v0       #bytes:[B
    .restart local v1       #c:B
    .restart local v3       #i:I
    .restart local v4       #j:I
    .restart local v6       #os:[B
    :cond_2
    add-int/lit8 v8, v3, 0x1

    aget-byte v8, v0, v8

    invoke-static {v8}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt4(B)I

    move-result v8

    shl-int/lit8 v8, v8, 0x4

    add-int/lit8 v9, v3, 0x2

    aget-byte v9, v0, v9

    invoke-static {v9}, Lorg/eclipse/jgit/util/RawParseUtils;->parseHexInt4(B)I

    move-result v9

    or-int v7, v8, v9

    .line 277
    .local v7, val:I
    add-int/lit8 v5, v4, 0x1

    .end local v4           #j:I
    .local v5, j:I
    int-to-byte v8, v7

    aput-byte v8, v6, v4

    .line 278
    add-int/lit8 v3, v3, 0x2

    move v4, v5

    .line 270
    .end local v5           #j:I
    .end local v7           #val:I
    .restart local v4       #j:I
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 280
    :cond_3
    add-int/lit8 v5, v4, 0x1

    .end local v4           #j:I
    .restart local v5       #j:I
    aput-byte v1, v6, v4

    move v4, v5

    .end local v5           #j:I
    .restart local v4       #j:I
    goto :goto_2

    .line 282
    .end local v1           #c:B
    :cond_4
    const/4 v8, 0x0

    invoke-static {v6, v8, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object p0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .parameter "obj"

    .prologue
    const/4 v1, 0x0

    .line 563
    instance-of v2, p1, Lorg/eclipse/jgit/transport/URIish;

    if-nez v2, :cond_1

    .line 578
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 565
    check-cast v0, Lorg/eclipse/jgit/transport/URIish;

    .line 566
    .local v0, b:Lorg/eclipse/jgit/transport/URIish;
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/transport/URIish;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 568
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/transport/URIish;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 570
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/transport/URIish;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 572
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/transport/URIish;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 574
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v3

    if-ne v2, v3, :cond_0

    .line 576
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/eclipse/jgit/transport/URIish;->eq(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 578
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 406
    iget-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getHumanishName()Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 695
    const-string v3, ""

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    .line 696
    :cond_0
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 697
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 699
    .local v2, s:Ljava/lang/String;
    const-string v3, "file"

    iget-object v4, p0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    sget-object v3, Lorg/eclipse/jgit/transport/URIish;->LOCAL_FILE:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 700
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[\\"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 703
    .local v0, elements:[Ljava/lang/String;
    :goto_0
    array-length v3, v0

    if-nez v3, :cond_4

    .line 704
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 702
    .end local v0           #elements:[Ljava/lang/String;
    :cond_3
    const-string v3, "/+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .restart local v0       #elements:[Ljava/lang/String;
    goto :goto_0

    .line 705
    :cond_4
    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    aget-object v1, v0, v3

    .line 706
    .local v1, result:Ljava/lang/String;
    const-string v3, ".git"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 707
    array-length v3, v0

    add-int/lit8 v3, v3, -0x2

    aget-object v1, v0, v3

    .line 711
    :cond_5
    :goto_1
    return-object v1

    .line 708
    :cond_6
    const-string v3, ".git"

    invoke-virtual {v1, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 709
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    const-string v5, ".git"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method public getPass()Ljava/lang/String;
    .locals 1

    .prologue
    .line 509
    iget-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->pass:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 446
    iget-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 529
    iget v0, p0, Lorg/eclipse/jgit/transport/URIish;->port:I

    return v0
.end method

.method public getRawPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 453
    iget-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    return-object v0
.end method

.method public getScheme()Ljava/lang/String;
    .locals 1

    .prologue
    .line 426
    iget-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 489
    iget-object v0, p0, Lorg/eclipse/jgit/transport/URIish;->user:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 546
    const/4 v0, 0x0

    .line 547
    .local v0, hc:I
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 548
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/lit8 v0, v1, 0x0

    .line 549
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 550
    mul-int/lit8 v1, v0, 0x1f

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getUser()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 551
    :cond_1
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 552
    mul-int/lit8 v1, v0, 0x1f

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPass()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 553
    :cond_2
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 554
    mul-int/lit8 v1, v0, 0x1f

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 555
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v1

    if-lez v1, :cond_4

    .line 556
    mul-int/lit8 v1, v0, 0x1f

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPort()I

    move-result v2

    add-int v0, v1, v2

    .line 557
    :cond_4
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 558
    mul-int/lit8 v1, v0, 0x1f

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 559
    :cond_5
    return v0
.end method

.method public isRemote()Z
    .locals 1

    .prologue
    .line 399
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/URIish;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setHost(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;
    .locals 1
    .parameter "n"

    .prologue
    .line 417
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/URIish;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 418
    .local v0, r:Lorg/eclipse/jgit/transport/URIish;
    iput-object p1, v0, Lorg/eclipse/jgit/transport/URIish;->host:Ljava/lang/String;

    .line 419
    return-object v0
.end method

.method public setPass(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;
    .locals 1
    .parameter "n"

    .prologue
    .line 520
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/URIish;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 521
    .local v0, r:Lorg/eclipse/jgit/transport/URIish;
    iput-object p1, v0, Lorg/eclipse/jgit/transport/URIish;->pass:Ljava/lang/String;

    .line 522
    return-object v0
.end method

.method public setPath(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;
    .locals 1
    .parameter "n"

    .prologue
    .line 464
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/URIish;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 465
    .local v0, r:Lorg/eclipse/jgit/transport/URIish;
    iput-object p1, v0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    .line 466
    iput-object p1, v0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    .line 467
    return-object v0
.end method

.method public setPort(I)Lorg/eclipse/jgit/transport/URIish;
    .locals 1
    .parameter "n"

    .prologue
    .line 540
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/URIish;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 541
    .local v0, r:Lorg/eclipse/jgit/transport/URIish;
    if-lez p1, :cond_0

    .end local p1
    :goto_0
    iput p1, v0, Lorg/eclipse/jgit/transport/URIish;->port:I

    .line 542
    return-object v0

    .line 541
    .restart local p1
    :cond_0
    const/4 p1, -0x1

    goto :goto_0
.end method

.method public setRawPath(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;
    .locals 2
    .parameter "n"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 479
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/URIish;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 480
    .local v0, r:Lorg/eclipse/jgit/transport/URIish;
    invoke-static {p1}, Lorg/eclipse/jgit/transport/URIish;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lorg/eclipse/jgit/transport/URIish;->path:Ljava/lang/String;

    .line 481
    iput-object p1, v0, Lorg/eclipse/jgit/transport/URIish;->rawPath:Ljava/lang/String;

    .line 482
    return-object v0
.end method

.method public setScheme(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;
    .locals 1
    .parameter "n"

    .prologue
    .line 437
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/URIish;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 438
    .local v0, r:Lorg/eclipse/jgit/transport/URIish;
    iput-object p1, v0, Lorg/eclipse/jgit/transport/URIish;->scheme:Ljava/lang/String;

    .line 439
    return-object v0
.end method

.method public setUser(Ljava/lang/String;)Lorg/eclipse/jgit/transport/URIish;
    .locals 1
    .parameter "n"

    .prologue
    .line 500
    new-instance v0, Lorg/eclipse/jgit/transport/URIish;

    invoke-direct {v0, p0}, Lorg/eclipse/jgit/transport/URIish;-><init>(Lorg/eclipse/jgit/transport/URIish;)V

    .line 501
    .local v0, r:Lorg/eclipse/jgit/transport/URIish;
    iput-object p1, v0, Lorg/eclipse/jgit/transport/URIish;->user:Ljava/lang/String;

    .line 502
    return-object v0
.end method

.method public toASCIIString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 649
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/transport/URIish;->format(ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toPrivateASCIIString()Ljava/lang/String;
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 657
    invoke-direct {p0, v0, v0}, Lorg/eclipse/jgit/transport/URIish;->format(ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toPrivateString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 595
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/eclipse/jgit/transport/URIish;->format(ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 599
    invoke-direct {p0, v0, v0}, Lorg/eclipse/jgit/transport/URIish;->format(ZZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
