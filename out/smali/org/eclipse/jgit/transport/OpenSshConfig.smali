.class public Lorg/eclipse/jgit/transport/OpenSshConfig;
.super Ljava/lang/Object;
.source "OpenSshConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    }
.end annotation


# static fields
.field static final SSH_PORT:I = 0x16


# instance fields
.field private final configFile:Ljava/io/File;

.field private final home:Ljava/io/File;

.field private hosts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/OpenSshConfig$Host;",
            ">;"
        }
    .end annotation
.end field

.field private lastModified:J


# direct methods
.method constructor <init>(Ljava/io/File;Ljava/io/File;)V
    .locals 1
    .parameter "h"
    .parameter "cfg"

    .prologue
    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    iput-object p1, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->home:Ljava/io/File;

    .line 116
    iput-object p2, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->configFile:Ljava/io/File;

    .line 117
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->hosts:Ljava/util/Map;

    .line 118
    return-void
.end method

.method private static dequote(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "value"

    .prologue
    .line 283
    const-string v0, "\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "\""

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 284
    const/4 v0, 0x1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 285
    .end local p0
    :cond_0
    return-object p0
.end method

.method public static get(Lorg/eclipse/jgit/util/FS;)Lorg/eclipse/jgit/transport/OpenSshConfig;
    .locals 5
    .parameter "fs"

    .prologue
    .line 92
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/FS;->userHome()Ljava/io/File;

    move-result-object v1

    .line 93
    .local v1, home:Ljava/io/File;
    if-nez v1, :cond_0

    .line 94
    new-instance v3, Ljava/io/File;

    const-string v4, "."

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v1

    .line 96
    :cond_0
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/io/File;

    const-string v4, ".ssh"

    invoke-direct {v3, v1, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-string v4, "config"

    invoke-direct {v0, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 97
    .local v0, config:Ljava/io/File;
    new-instance v2, Lorg/eclipse/jgit/transport/OpenSshConfig;

    invoke-direct {v2, v1, v0}, Lorg/eclipse/jgit/transport/OpenSshConfig;-><init>(Ljava/io/File;Ljava/io/File;)V

    .line 98
    .local v2, osc:Lorg/eclipse/jgit/transport/OpenSshConfig;
    invoke-direct {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->refresh()Ljava/util/Map;

    .line 99
    return-object v2
.end method

.method private static isHostMatch(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3
    .parameter "pattern"
    .parameter "name"

    .prologue
    .line 274
    :try_start_0
    new-instance v1, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;-><init>(Ljava/lang/String;Ljava/lang/Character;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/InvalidPatternException; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    .local v1, fn:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;
    invoke-virtual {v1, p1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->append(Ljava/lang/String;)V

    .line 279
    invoke-virtual {v1}, Lorg/eclipse/jgit/fnmatch/FileNameMatcher;->isMatch()Z

    move-result v2

    .end local v1           #fn:Lorg/eclipse/jgit/fnmatch/FileNameMatcher;
    :goto_0
    return v2

    .line 275
    :catch_0
    move-exception v0

    .line 276
    .local v0, e:Lorg/eclipse/jgit/errors/InvalidPatternException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private static isHostPattern(Ljava/lang/String;)Z
    .locals 1
    .parameter "s"

    .prologue
    .line 268
    const/16 v0, 0x2a

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_0

    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static nows(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .parameter "value"

    .prologue
    .line 289
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 290
    .local v0, b:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 291
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->isSpaceChar(C)Z

    move-result v2

    if-nez v2, :cond_0

    .line 292
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 290
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 294
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private parse(Ljava/io/InputStream;)Ljava/util/Map;
    .locals 20
    .parameter "in"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/OpenSshConfig$Host;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12}, Ljava/util/LinkedHashMap;-><init>()V

    .line 179
    .local v12, m:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/OpenSshConfig$Host;>;"
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v18, Ljava/io/InputStreamReader;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v18

    invoke-direct {v4, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 180
    .local v4, br:Ljava/io/BufferedReader;
    new-instance v7, Ljava/util/ArrayList;

    const/16 v18, 0x4

    move/from16 v0, v18

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 183
    .local v7, current:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/OpenSshConfig$Host;>;"
    :cond_0
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v11

    .local v11, line:Ljava/lang/String;
    if-eqz v11, :cond_12

    .line 184
    invoke-virtual {v11}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    .line 185
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v18

    if-eqz v18, :cond_0

    const-string v18, "#"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v18

    if-nez v18, :cond_0

    .line 188
    const-string v18, "[ \t]*[= \t]"

    const/16 v19, 0x2

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v11, v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v14

    .line 189
    .local v14, parts:[Ljava/lang/String;
    const/16 v18, 0x0

    aget-object v18, v14, v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    .line 190
    .local v9, keyword:Ljava/lang/String;
    const/16 v18, 0x1

    aget-object v18, v14, v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 192
    .local v2, argValue:Ljava/lang/String;
    const-string v18, "Host"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_2

    .line 193
    invoke-interface {v7}, Ljava/util/List;->clear()V

    .line 194
    const-string v18, "[ \t]"

    move-object/from16 v0, v18

    invoke-virtual {v2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .local v3, arr$:[Ljava/lang/String;
    array-length v10, v3

    .local v10, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_1
    if-ge v8, v10, :cond_0

    aget-object v15, v3, v8

    .line 195
    .local v15, pattern:Ljava/lang/String;
    invoke-static {v15}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 196
    .local v13, name:Ljava/lang/String;
    invoke-interface {v12, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 197
    .local v5, c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    if-nez v5, :cond_1

    .line 198
    new-instance v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    invoke-direct {v5}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;-><init>()V

    .line 199
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    invoke-interface {v12, v13, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    :cond_1
    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 194
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 206
    .end local v3           #arr$:[Ljava/lang/String;
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v8           #i$:I
    .end local v10           #len$:I
    .end local v13           #name:Ljava/lang/String;
    .end local v15           #pattern:Ljava/lang/String;
    :cond_2
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v18

    if-nez v18, :cond_0

    .line 213
    const-string v18, "HostName"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 214
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, i$:Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 215
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    iget-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->hostName:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_3

    .line 216
    invoke-static {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->hostName:Ljava/lang/String;

    goto :goto_2

    .line 217
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v8           #i$:Ljava/util/Iterator;
    :cond_4
    const-string v18, "User"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 218
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8       #i$:Ljava/util/Iterator;
    :cond_5
    :goto_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 219
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    iget-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->user:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_5

    .line 220
    invoke-static {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->user:Ljava/lang/String;

    goto :goto_3

    .line 221
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v8           #i$:Ljava/util/Iterator;
    :cond_6
    const-string v18, "Port"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_8

    .line 223
    :try_start_0
    invoke-static {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v16

    .line 224
    .local v16, port:I
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8       #i$:Ljava/util/Iterator;
    :cond_7
    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 225
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    iget v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->port:I

    move/from16 v18, v0

    if-nez v18, :cond_7

    .line 226
    move/from16 v0, v16

    iput v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->port:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    .line 227
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v16           #port:I
    :catch_0
    move-exception v18

    goto/16 :goto_0

    .line 230
    :cond_8
    const-string v18, "IdentityFile"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_a

    .line 231
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8       #i$:Ljava/util/Iterator;
    :cond_9
    :goto_5
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 232
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    iget-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->identityFile:Ljava/io/File;

    move-object/from16 v18, v0

    if-nez v18, :cond_9

    .line 233
    invoke-static {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/transport/OpenSshConfig;->toFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->identityFile:Ljava/io/File;

    goto :goto_5

    .line 234
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v8           #i$:Ljava/util/Iterator;
    :cond_a
    const-string v18, "PreferredAuthentications"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_c

    .line 236
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8       #i$:Ljava/util/Iterator;
    :cond_b
    :goto_6
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 237
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    iget-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->preferredAuthentications:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_b

    .line 238
    invoke-static {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/eclipse/jgit/transport/OpenSshConfig;->nows(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->preferredAuthentications:Ljava/lang/String;

    goto :goto_6

    .line 239
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v8           #i$:Ljava/util/Iterator;
    :cond_c
    const-string v18, "BatchMode"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_e

    .line 240
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8       #i$:Ljava/util/Iterator;
    :cond_d
    :goto_7
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 241
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    iget-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->batchMode:Ljava/lang/Boolean;

    move-object/from16 v18, v0

    if-nez v18, :cond_d

    .line 242
    invoke-static {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/eclipse/jgit/transport/OpenSshConfig;->yesno(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v18

    move-object/from16 v0, v18

    iput-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->batchMode:Ljava/lang/Boolean;

    goto :goto_7

    .line 243
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v8           #i$:Ljava/util/Iterator;
    :cond_e
    const-string v18, "StrictHostKeyChecking"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_10

    .line 245
    invoke-static {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 246
    .local v17, value:Ljava/lang/String;
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8       #i$:Ljava/util/Iterator;
    :cond_f
    :goto_8
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 247
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    iget-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->strictHostKeyChecking:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_f

    .line 248
    move-object/from16 v0, v17

    iput-object v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->strictHostKeyChecking:Ljava/lang/String;

    goto :goto_8

    .line 249
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v8           #i$:Ljava/util/Iterator;
    .end local v17           #value:Ljava/lang/String;
    :cond_10
    const-string v18, "ConnectionAttempts"

    move-object/from16 v0, v18

    invoke-static {v0, v9}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v18

    if-eqz v18, :cond_0

    .line 252
    :try_start_1
    invoke-static {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig;->dequote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 253
    .local v6, connectionAttempts:I
    if-lez v6, :cond_0

    .line 254
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .restart local v8       #i$:Ljava/util/Iterator;
    :cond_11
    :goto_9
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_0

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 255
    .restart local v5       #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    iget v0, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->connectionAttempts:I

    move/from16 v18, v0

    if-nez v18, :cond_11

    .line 256
    iput v6, v5, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->connectionAttempts:I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_9

    .line 258
    .end local v5           #c:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .end local v6           #connectionAttempts:I
    .end local v8           #i$:Ljava/util/Iterator;
    :catch_1
    move-exception v18

    goto/16 :goto_0

    .line 264
    .end local v2           #argValue:Ljava/lang/String;
    .end local v9           #keyword:Ljava/lang/String;
    .end local v14           #parts:[Ljava/lang/String;
    :cond_12
    return-object v12
.end method

.method private declared-synchronized refresh()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/transport/OpenSshConfig$Host;",
            ">;"
        }
    .end annotation

    .prologue
    .line 158
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->configFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 159
    .local v2, mtime:J
    iget-wide v5, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->lastModified:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    cmp-long v5, v2, v5

    if-eqz v5, :cond_0

    .line 161
    :try_start_1
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v5, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->configFile:Ljava/io/File;

    invoke-direct {v1, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 163
    .local v1, in:Ljava/io/FileInputStream;
    :try_start_2
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/transport/OpenSshConfig;->parse(Ljava/io/InputStream;)Ljava/util/Map;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->hosts:Ljava/util/Map;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 165
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 172
    .end local v1           #in:Ljava/io/FileInputStream;
    :goto_0
    :try_start_4
    iput-wide v2, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->lastModified:J

    .line 174
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->hosts:Ljava/util/Map;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    monitor-exit p0

    return-object v5

    .line 165
    .restart local v1       #in:Ljava/io/FileInputStream;
    :catchall_0
    move-exception v5

    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    throw v5
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/io/FileNotFoundException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    .line 167
    .end local v1           #in:Ljava/io/FileInputStream;
    :catch_0
    move-exception v4

    .line 168
    .local v4, none:Ljava/io/FileNotFoundException;
    :try_start_6
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->hosts:Ljava/util/Map;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_0

    .line 158
    .end local v2           #mtime:J
    .end local v4           #none:Ljava/io/FileNotFoundException;
    :catchall_1
    move-exception v5

    monitor-exit p0

    throw v5

    .line 169
    .restart local v2       #mtime:J
    :catch_1
    move-exception v0

    .line 170
    .local v0, err:Ljava/io/IOException;
    :try_start_7
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->hosts:Ljava/util/Map;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto :goto_0
.end method

.method private toFile(Ljava/lang/String;)Ljava/io/File;
    .locals 3
    .parameter "path"

    .prologue
    .line 304
    const-string v1, "~/"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 305
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->home:Ljava/io/File;

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 309
    :cond_0
    :goto_0
    return-object v0

    .line 306
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 307
    .local v0, ret:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isAbsolute()Z

    move-result v1

    if-nez v1, :cond_0

    .line 309
    new-instance v0, Ljava/io/File;

    .end local v0           #ret:Ljava/io/File;
    iget-object v1, p0, Lorg/eclipse/jgit/transport/OpenSshConfig;->home:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method

.method static userName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 313
    new-instance v0, Lorg/eclipse/jgit/transport/OpenSshConfig$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/OpenSshConfig$1;-><init>()V

    invoke-static {v0}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private static yesno(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1
    .parameter "value"

    .prologue
    .line 298
    const-string v0, "yes"

    invoke-static {v0, p0}, Lorg/eclipse/jgit/util/StringUtils;->equalsIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 300
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0
.end method


# virtual methods
.method public lookup(Ljava/lang/String;)Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    .locals 6
    .parameter "hostName"

    .prologue
    const/4 v5, 0x1

    .line 130
    invoke-direct {p0}, Lorg/eclipse/jgit/transport/OpenSshConfig;->refresh()Ljava/util/Map;

    move-result-object v0

    .line 131
    .local v0, cache:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/transport/OpenSshConfig$Host;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .line 132
    .local v2, h:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    if-nez v2, :cond_0

    .line 133
    new-instance v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    .end local v2           #h:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    invoke-direct {v2}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;-><init>()V

    .line 134
    .restart local v2       #h:Lorg/eclipse/jgit/transport/OpenSshConfig$Host;
    :cond_0
    iget-boolean v4, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->patternsApplied:Z

    if-eqz v4, :cond_1

    .line 154
    :goto_0
    return-object v2

    .line 137
    :cond_1
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 138
    .local v1, e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/transport/OpenSshConfig$Host;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lorg/eclipse/jgit/transport/OpenSshConfig;->isHostPattern(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 140
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4, p1}, Lorg/eclipse/jgit/transport/OpenSshConfig;->isHostMatch(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 142
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;

    invoke-virtual {v2, v4}, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->copyFrom(Lorg/eclipse/jgit/transport/OpenSshConfig$Host;)V

    goto :goto_1

    .line 145
    .end local v1           #e:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/String;Lorg/eclipse/jgit/transport/OpenSshConfig$Host;>;"
    :cond_3
    iget-object v4, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->hostName:Ljava/lang/String;

    if-nez v4, :cond_4

    .line 146
    iput-object p1, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->hostName:Ljava/lang/String;

    .line 147
    :cond_4
    iget-object v4, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->user:Ljava/lang/String;

    if-nez v4, :cond_5

    .line 148
    invoke-static {}, Lorg/eclipse/jgit/transport/OpenSshConfig;->userName()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->user:Ljava/lang/String;

    .line 149
    :cond_5
    iget v4, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->port:I

    if-nez v4, :cond_6

    .line 150
    const/16 v4, 0x16

    iput v4, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->port:I

    .line 151
    :cond_6
    iget v4, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->connectionAttempts:I

    if-nez v4, :cond_7

    .line 152
    iput v5, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->connectionAttempts:I

    .line 153
    :cond_7
    iput-boolean v5, v2, Lorg/eclipse/jgit/transport/OpenSshConfig$Host;->patternsApplied:Z

    goto :goto_0
.end method
